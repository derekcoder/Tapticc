//
//  Tapticc.swift
//  Tapticc
//
//  Created by Derek on 5/12/18.
//

import UIKit

public class Tapticc {
    public enum TapticStyle {
        case lightImpact
        case mediumImpact
        case heavyImpact
        case notificationSuccess
        case notificationWarning
        case notificationError
        case selection
    }
    
    public static var isEnabled: Bool = true
    
    public static let impact = Tapticc.Impact()
    public static let notification = Tapticc.Notification()
    public static let selection = Tapticc.Selection()
    
    public static func prepare(for style: Tapticc.TapticStyle) {
        guard Tapticc.isEnabled else { return }
        switch style {
        case .lightImpact: impact.prepare(for: .light)
        case .mediumImpact: impact.prepare(for: .medium)
        case .heavyImpact: impact.prepare(for: .heavy)
        case .notificationSuccess, .notificationWarning, .notificationError: notification.prepare()
        case .selection: selection.prepare()
        }
    }
    
    public static func feedback(with style: Tapticc.TapticStyle) {
        guard Tapticc.isEnabled else { return }
        switch style {
        case .lightImpact: impact.feedback(with: .light)
        case .mediumImpact: impact.feedback(with: .medium)
        case .heavyImpact: impact.feedback(with: .heavy)
        case .notificationSuccess: notification.feedback(with: .success)
        case .notificationWarning: notification.feedback(with: .warning)
        case .notificationError: notification.feedback(with: .error)
        case .selection: selection.feedback()
        }
    }
    
    public class Impact {
        private var style: UIImpactFeedbackGenerator.FeedbackStyle = .light
        private var generator: UIImpactFeedbackGenerator = Impact.makeGenerator(.light)
        
        public func prepare(for style: UIImpactFeedbackGenerator.FeedbackStyle) {
            guard Tapticc.isEnabled else { return }
            updateGeneratorIfNeeded(for: style)
            generator.prepare()
        }
        
        public func feedback(with style: UIImpactFeedbackGenerator.FeedbackStyle) {
            guard Tapticc.isEnabled else { return }
            updateGeneratorIfNeeded(for: style)
            generator.impactOccurred()
            generator.prepare()
        }
        
        private func updateGeneratorIfNeeded(for style: UIImpactFeedbackGenerator.FeedbackStyle) {
            guard self.style != style else { return }
            self.style = style
            generator = Impact.makeGenerator(style)
        }
        
        private static func makeGenerator(_ style: UIImpactFeedbackGenerator.FeedbackStyle) -> UIImpactFeedbackGenerator {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.prepare()
            return generator
        }
    }
    
    public class Notification {
        private var generator: UINotificationFeedbackGenerator = {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            return generator
        }()
        
        public func prepare() {
            guard Tapticc.isEnabled else { return }
            generator.prepare()
        }
        
        public func feedback(with type: UINotificationFeedbackGenerator.FeedbackType) {
            guard Tapticc.isEnabled else { return }
            generator.notificationOccurred(type)
            generator.prepare()
        }
    }
    
    public class Selection {
        private var generator: UISelectionFeedbackGenerator = {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            return generator
        }()
        
        public func prepare() {
            guard Tapticc.isEnabled else { return }
            generator.prepare()
        }
        
        public func feedback() {
            guard Tapticc.isEnabled else { return }
            generator.selectionChanged()
        }
    }
}
