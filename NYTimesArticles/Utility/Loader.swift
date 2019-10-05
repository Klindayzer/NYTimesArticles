/*
 *	Loader.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import MBProgressHUD

class Loader {
    
    static func show(in view: UIView) {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    static func hide(from view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
