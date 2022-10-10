//
//  UIView+Extension.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 10/10/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
