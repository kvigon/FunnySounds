//
//  ButtonsHeight.swift
//  FunnySounds
//
//  Created by Миша on 8/1/23.
//

import Foundation

struct ConstreinsToPlayButtonsAndLabel {
    
    var widhAndHeightPlayButtons: CGFloat = 100
    var bottomAnchorFomPlayButtonSecond: CGFloat = 100
    var topAnchorFomPlayButtonSecond: CGFloat = 100
    var appNameLabelTopAnchor: CGFloat = 45
    var fontAllButtons: CGFloat = 20
    
    init(screenHight: ScreenHeightVariants) {
        switch screenHight {
        case .iphoneSix:
            widhAndHeightPlayButtons = 100
            bottomAnchorFomPlayButtonSecond = -60
            topAnchorFomPlayButtonSecond = 60
            appNameLabelTopAnchor = 20
            fontAllButtons = 15
        case .iphoneEightPlus:
            widhAndHeightPlayButtons = 120
            bottomAnchorFomPlayButtonSecond = -100
            topAnchorFomPlayButtonSecond = 100
            appNameLabelTopAnchor = 45
            fontAllButtons = 20
        case .Ipad:
            widhAndHeightPlayButtons = 200
            bottomAnchorFomPlayButtonSecond = -80
            topAnchorFomPlayButtonSecond = 80
            appNameLabelTopAnchor = 45
            fontAllButtons = 25
        }
    }
}
