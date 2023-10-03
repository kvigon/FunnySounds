//
//  ScreenHeight.swift
//  FunnySounds
//
//  Created by Миша on 8/1/23.
//

import Foundation

enum ScreenHeightVariants {
    case iphoneSix
    case iphoneEightPlus
    case Ipad
}

final class ScreenHeightCalculate {
    
    static var variableHeight: ScreenHeightVariants = .iphoneSix
    
    static func calculaiteHeight(screenHeight: CGFloat) {
        if screenHeight < 700 {
            variableHeight = .iphoneSix
        }
        if screenHeight > 700 && screenHeight < 1100 {
            variableHeight = .iphoneEightPlus
        }
        if screenHeight > 1100 {
            variableHeight = .Ipad
        }
    }
}
