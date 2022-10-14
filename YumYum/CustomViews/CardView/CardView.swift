//
//  CardView.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 5
        cornerRadius = 15
    }
}
