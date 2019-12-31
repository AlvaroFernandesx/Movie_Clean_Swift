//
//  Colors.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let cellGray = UIColor(named: "cellGray")
    static let shadowGray = UIColor(named: "shadowGray")
    static let fontDark = UIColor(named: "fontDark")
}

extension UIFont {
    
    static func configure(fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: weight)
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: fontSize)
        }
        
        return systemFont
    }
    
}
