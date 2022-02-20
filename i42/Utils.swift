//
//  Utils.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI


extension String {
    func firstWord() -> String? {
        return self.components(separatedBy: " ").first
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    
    func widthPercentageSize(p:Float) -> CGFloat {
        return (UIScreen.main.bounds.size.width * CGFloat(p)) / 100
    }
    
    func heightPercentageSize(p:Float) -> CGFloat {
        return (UIScreen.main.bounds.size.height * CGFloat(p)) / 100
    }
}
