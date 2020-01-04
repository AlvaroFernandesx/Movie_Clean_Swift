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
    static let fontWhite = UIColor(named: "greenWhite")
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

extension UIImage {
    
    static let lupa = #imageLiteral(resourceName: "lupa")
    static let newMovie = #imageLiteral(resourceName: "newMoview")
    static let popular = #imageLiteral(resourceName: "popular")
    
}

extension CGFloat {
    static let movieViewTop = CGFloat(10)
    static let movieViewBottom = CGFloat(-10)
    static let movieViewLeading = CGFloat(24)
    static let movieViewTrailing = CGFloat(-24)
    static let movieViewHeight = CGFloat(250)
    
    static let movieImageViewTop = CGFloat(10)
    static let movieImageViewBottom = CGFloat(-10)
    static let movieImageViewLeading = CGFloat(10)
    static let movieImageViewTrailing = CGFloat(-190)
    static let movieImageViewWidth = CGFloat(150)
    static let movieImageViewHeigth = CGFloat(230)
    
    static let movieTitleLabelLeading = CGFloat(150)
    static let movieTitleLabelTrailing = CGFloat(-10)
    
    static let footerViewSpacing = CGFloat(70)
}
