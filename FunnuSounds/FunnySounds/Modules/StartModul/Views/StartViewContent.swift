//
//  ViewControllerContent.swift
//  FunnySounds
//
//  Created by Миша on 7/25/23.
//

import Foundation
import UIKit

final class StartViewContent: UIView {
    
    var presenter: StartViewPresenterProtocol!
    
    let startVCBackground: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode =  UIView.ContentMode.scaleAspectFill
        background.clipsToBounds = true
        background.image = UIImage(named: "startVCBackground.jpg")
        background.center = background.center
        
        return background
    }()
    
    let playButtonOne: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), title: nil)
        
        return button
    }()
    
    let playButtonSecond: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), title: nil)
        
        return button
    }()
    
    let playButtonThird: PlayButton = {
        let button = PlayButton(backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), title: nil)
        
        return button
    }()
    
    let playListButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        button.alpha = 0.6
        button.layer.shadowOpacity = 5
        button.setTitle("Playlist", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let recordButton: UIButton = {
        var recordButton = UIButton()
        recordButton.backgroundColor = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        recordButton.alpha = 0.6
        recordButton.layer.shadowOpacity = 5
        recordButton.layer.cornerRadius = 8
        recordButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        recordButton.setTitle("Record", for: .normal)
        recordButton.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 20)
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        
        return recordButton
        
    }()
    
    private let dynamicConstrains: ConstreinsToPlayButtonsAndLabel
    private let dynamicConstreinsPlayListButton: ConstreinsToPlayListButton
    private let dynamicConstreinsRecordButton: ConstreinsToRecordButton
    
    private let appNameLabel: CustomLabels = {
        let label = CustomLabels()
        
        return label
    }()
    
    init() {
        dynamicConstrains = ConstreinsToPlayButtonsAndLabel(screenHight: ScreenHeightCalculate.variableHeight)
        dynamicConstreinsPlayListButton = ConstreinsToPlayListButton(screenHight: ScreenHeightCalculate.variableHeight)
        dynamicConstreinsRecordButton = ConstreinsToRecordButton(screenHight: ScreenHeightCalculate.variableHeight)
        super.init(frame: .zero)
        addSubviews()
        makeConstrainsButton()
        makeAppearanceButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animatedButton(button: UIButton) {
        UIView.animate(withDuration: 0.2,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                       completion: { finish in
            UIView.animate(withDuration: 0.2, animations: {
                button.transform = CGAffineTransform.identity
            })
        })
    }
    
    private func addSubviews() {
        addSubview(startVCBackground)
        addSubview(playButtonOne)
        addSubview(playButtonSecond)
        addSubview(playButtonThird)
        addSubview(appNameLabel)
        addSubview(playListButton)
        addSubview(recordButton)
    }
    
    private func makeConstrainsButton() {
        NSLayoutConstraint.activate(
            [
                startVCBackground.topAnchor.constraint(equalTo: topAnchor),
                startVCBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
                startVCBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
                startVCBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                playButtonOne.bottomAnchor.constraint(equalTo: playButtonSecond.topAnchor, constant: (dynamicConstrains.bottomAnchorFomPlayButtonSecond)),
                playButtonOne.centerXAnchor.constraint(equalTo: centerXAnchor),
                playButtonOne.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                playButtonOne.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                playButtonSecond.centerXAnchor.constraint(equalTo: centerXAnchor),
                playButtonSecond.centerYAnchor.constraint(equalTo: centerYAnchor),
                playButtonSecond.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                playButtonSecond.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                playButtonThird.centerXAnchor.constraint(equalTo: centerXAnchor),
                playButtonThird.topAnchor.constraint(equalTo: playButtonSecond.bottomAnchor, constant: (dynamicConstrains.topAnchorFomPlayButtonSecond)),
                playButtonThird.widthAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                playButtonThird.heightAnchor.constraint(equalToConstant: (dynamicConstrains.widhAndHeightPlayButtons)),
                
                appNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: (dynamicConstrains.appNameLabelTopAnchor)),
                appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                playListButton.topAnchor.constraint(equalTo: topAnchor, constant: (dynamicConstreinsPlayListButton.playListButtonTopAnchor)),
                playListButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
                playListButton.widthAnchor.constraint(equalToConstant: (dynamicConstreinsPlayListButton.widhPlayListButton)),
                playListButton.heightAnchor.constraint(equalToConstant: (dynamicConstreinsPlayListButton.heightPlayListButton)),
                
                recordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                recordButton.widthAnchor.constraint(equalToConstant: (dynamicConstreinsRecordButton.widhRecordButton)),
                recordButton.heightAnchor.constraint(equalToConstant: (dynamicConstreinsRecordButton.heightRecordButton)),
                recordButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            ]
        )
    }
    
    private func makeAppearanceButtons() {
        playButtonOne.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        playButtonOne.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        playButtonSecond.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        playButtonSecond.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        playButtonThird.layer.cornerRadius = (dynamicConstrains.widhAndHeightPlayButtons/2)
        playButtonThird.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        playListButton.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
        recordButton.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: (dynamicConstrains.fontAllButtons))
    }
}


