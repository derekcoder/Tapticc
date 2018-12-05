//
//  ViewController.swift
//  Tapticc
//
//  Created by derekcoder@gmail.com on 12/05/2018.
//  Copyright (c) 2018 derekcoder@gmail.com. All rights reserved.
//

import UIKit
import Tapticc

class ViewController: UIViewController {

    @IBAction func showImpactFeedback(_ sender: UIButton) {
        let alert = UIAlertController(title: "Impact Feedback", message: nil, preferredStyle: .actionSheet)
        let lightAction = UIAlertAction(title: "Light", style: .default) { _ in
            Tapticc.feedback(with: .lightImpact)
        }
        let mediumAction = UIAlertAction(title: "Medium", style: .default) { _ in
            Tapticc.feedback(with: .mediumImpact)
        }
        let heavyAction = UIAlertAction(title: "Heavy", style: .default) { _ in
            Tapticc.feedback(with: .heavyImpact)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(lightAction)
        alert.addAction(mediumAction)
        alert.addAction(heavyAction)
        alert.addAction(cancelAction)
        if let popover = alert.popoverPresentationController {
            popover.sourceView = sender
            popover.sourceRect = sender.frame
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showNotificationFeedback(_ sender: UIButton) {
        let alert = UIAlertController(title: "Notification Feedback", message: nil, preferredStyle: .actionSheet)
        let successAction = UIAlertAction(title: "Success", style: .default) { _ in
            Tapticc.feedback(with: .notificationSuccess)
        }
        let warningAction = UIAlertAction(title: "Warning", style: .default) { _ in
            Tapticc.feedback(with: .notificationWarning)
        }
        let errorAction = UIAlertAction(title: "Error", style: .default) { _ in
            Tapticc.feedback(with: .notificationError)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(successAction)
        alert.addAction(warningAction)
        alert.addAction(errorAction)
        alert.addAction(cancelAction)
        if let popover = alert.popoverPresentationController {
            popover.sourceView = sender
            popover.sourceRect = sender.frame
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showSelectionFeedback(_ sender: UIButton) {
        Tapticc.feedback(with: .selection)
    }
}

