/*
 *	AlertPresentable.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

typealias ActionCallBack = (Int) -> Void

struct ActionButton {
    
    let title: String
    let style: UIAlertAction.Style
}

protocol AlertPresentable {
    
    func showAlert(title: String, message: String, buttons: [ActionButton], action: ActionCallBack?)
    func hideAlert()
}

extension AlertPresentable where Self: UIViewController {
    
    func showAlert(title: String, message: String, buttons: [ActionButton], action: ActionCallBack? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.enumerated().forEach { (index, element) in
            
            let action = UIAlertAction(title: element.title, style: element.style, handler: { _ in
                action?(index)
            })
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func hideAlert() {
        
        if self.navigationController?.visibleViewController is UIAlertController {
            dismiss(animated: true, completion: nil)
        }
    }
}
