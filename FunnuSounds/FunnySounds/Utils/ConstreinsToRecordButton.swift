//
//  ConstreinsToRecordButton.swift
//  FunnySounds
//
//  Created by Миша on 8/10/23.
//

import Foundation

struct ConstreinsToRecordButton {
    
    var heightRecordButton: CGFloat = 60
    var widhRecordButton: CGFloat = 120
    
    init(screenHight: ScreenHeightVariants) {
        switch screenHight {
        case .iphoneSix:
            heightRecordButton = 40
            widhRecordButton = 100
        case .iphoneEightPlus:
            heightRecordButton = 60
            widhRecordButton = 120
        case .Ipad:
            heightRecordButton = 80
            widhRecordButton = 200
            
        }
    }
}
