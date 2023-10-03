//
//  PlayButton.swift
//  FunnySounds
//
//  Created by Миша on 7/31/23.
//

import Foundation
import UIKit

class PlayButton: UIButton {
    
    enum State {
        case noData
        case readyToPlay(title: String)
        case plaing
    }
    
    var customState: State = .noData
    
    func changeState(newState: State) {
        switch newState {
        case .noData:
            customState = .noData
            setTitle("No sound", for: .normal)
        case let .readyToPlay(title):
            customState = .readyToPlay(title: title)
            setTitle(title, for: .normal)
        case .plaing:
            customState = .plaing
            setTitle("Stop", for: .normal)
        }
    }
    //TODO бэк и титл в настройки кнопки
    init(backgroundColor: UIColor, title: String?) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupButton()
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        alpha = 0.8
        layer.cornerRadius = 60
        layer.shadowRadius = 3
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset =  .zero
        layer.shouldRasterize = true
        titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 20)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
