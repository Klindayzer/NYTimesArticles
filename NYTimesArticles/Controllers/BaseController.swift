/*
 *	BaseController.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit

class BaseController: UIViewController, AlertPresentable {
    
    fileprivate enum Keys: String, Localizable {
        
        case noInternetAlertTitle = "no_internet_alert_title"
        case noInternetAlertMessage = "no_internet_alert_message"
        case okAlertAction = "ok"
    }
    
    // MARK: - Overridden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startObservingNetworkReachability()
    }
    
    // MARK: - Protected Methods
    fileprivate func startObservingNetworkReachability() {
        
        isNetworkReachable.skipFirstAndBind { [weak self] isConnected in
            isConnected ? self?.hideReachabilityAlert() : self?.showReachabilityAlert()
        }
    }
    
    fileprivate func showReachabilityAlert() {
        
        showAlert(title: Keys.noInternetAlertTitle.value,
                  message: Keys.noInternetAlertMessage.value,
                  buttons: [ActionButton(title: Keys.okAlertAction.value, style: .default)])
    }
    
    fileprivate func hideReachabilityAlert() {
        hideAlert()
    }
    
    
    // MARK: - Exposed Methods
    func startLoading() {
        Loader.show(in: view)
    }
    
    func stopLoading() {
        Loader.hide(from: view)
    }
}
