/*
 *	NetworkReachability.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/3/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import Foundation
import Alamofire


// MARK: - Definitions
protocol NetworkAvailableDelegate: AnyObject {
    func onNetworkChange(_ isConnected: Bool)
}

fileprivate protocol NetworkReachable {
    
    var isReachable: Bool { get }
    func startObservingReachability()
}

final class NetworkReachability: NetworkReachable {
    
    // MARK: - shared instance
    static let shared = NetworkReachability()
    fileprivate init() {}
    
    
    // MARK: - Protected Properties
    fileprivate let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    
    // MARK: - Exposed Properties
    weak var delegate: NetworkAvailableDelegate?
    var isReachable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    
    // MARK: - Exposed Methods
    func startObservingReachability() {
        
        reachabilityManager?.listener = { [weak self] status in
            
            var isConnected: Bool {
                switch status {
                case .reachable: return true
                default: return false
                }
            }
            self?.delegate?.onNetworkChange(isConnected)
        }
        reachabilityManager?.startListening()
    }
}
