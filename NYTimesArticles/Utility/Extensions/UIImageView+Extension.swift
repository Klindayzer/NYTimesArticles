/*
 *	UIImageView+Extension.swift
 *	NYTimesArticles
 *
 *	Created by Adham Alkhateeb on 10/6/19.
 *	Copyright 2019 Adham Alkhateeb. All rights reserved.
 */

import UIKit
import SDWebImage

extension UIImageView {

    func setImage(with urlString: String) {
        
        let url = URL(string: urlString)
        sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
    }
}
