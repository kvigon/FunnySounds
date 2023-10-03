//
//  SetContentView.swift
//  FunnySounds
//
//  Created by Миша on 7/25/23.
//

import Foundation
import UIKit

final class SetRecordOnButtonContentView: UIView {
    
    
    let setButtonOne: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), title: "Set first")
        
        return button
    }()
    
    let setButtonSecond: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), title: "Set second")
        
        return button
    }()
    
    let setButtonThird: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), title: "Set third")
        
        return button
    }()
    
    private let setVCBackground: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode =  UIView.ContentMode.scaleAspectFill
        background.clipsToBounds = true
        background.image = UIImage(named: "SetVCBackground.jpg")
        background.center = background.center
        
        return background
    }()
    
    private let appNameLabel: CustomLabels = {
        let label = CustomLabels()
        
        return label
    }()
    
    private var dynamicConstrains: ConstreinsToPlayButtonsAndLabel
    
    init() {
        dynamicConstrains = ConstreinsToPlayButtonsAndLabel(screenHight: ScreenHeightCalculate.variableHeight)
        super.init(frame: .zero)
        addSubviews()
        makeConstrains()
        makeAppearanceButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(setVCBackground)
        addSubview(setButtonOne)
        addSubview(setButtonSecond)
        addSubview(setButtonThird)
        addSubview(appNameLabel)
    }
    
    private func makeConstrains() {
        NSLayoutConstraint.activate(
            [
                setVCBackground.topAnchor.constraint(equalTo: topAnchor),
                setVCBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
                setVCBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
                setVCBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                setButtonOne.bottomAnchor.constraint(equalTo: setButtonSecond.topAnchor, constant: (dynamicConstrains.bottomAnchorFomPlayButtonSecond)),
                setButtonOne.centerXAnchor.constraint(equalTo: centerXAnchor),
                setButtonOne.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                setButtonOne.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                setButtonSecond.centerXAnchor.constraint(equalTo: centerXAnchor),
                setButtonSecond.centerYAnchor.constraint(equalTo: centerYAnchor),
                setButtonSecond.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                setButtonSecond.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                setButtonThird.centerXAnchor.constraint(equalTo: centerXAnchor),
                setButtonThird.topAnchor.constraint(equalTo: setButtonSecond.bottomAnchor, constant: (dynamicConstrains.topAnchorFomPlayButtonSecond)),
                setButtonThird.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                setButtonThird.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                appNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: (dynamicConstrains.appNameLabelTopAnchor)),
                appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
    }
    
    private func makeAppearanceButtons() {
        setButtonOne.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        setButtonSecond.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        setButtonThird.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        
        setButtonOne.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        setButtonSecond.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        setButtonThird.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
    }
}

