//
//  ConstreinsToPlayListButton.swift
//  FunnySounds
//
//  Created by Миша on 8/10/23.
//

import Foundation

struct ConstreinsToPlayListButton {
    
    var playListButtonTopAnchor: CGFloat = 100
    var heightPlayListButton: CGFloat = 40
    var widhPlayListButton: CGFloat = 120
    
    init(screenHight: ScreenHeightVariants) {
        switch screenHight {
        case .iphoneSix:
            playListButtonTopAnchor = 70
            heightPlayListButton = 40
            widhPlayListButton = 100
        case .iphoneEightPlus:
            playListButtonTopAnchor = 100
            heightPlayListButton = 40
            widhPlayListButton = 120
        case .Ipad:
            playListButtonTopAnchor = 100
            heightPlayListButton = 60
            widhPlayListButton = 200
        }
    }
}
