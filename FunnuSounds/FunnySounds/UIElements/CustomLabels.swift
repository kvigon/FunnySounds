//
//  CustomLabels.swift
//  FunnySounds
//
//  Created by Миша on 7/25/23.
//

import Foundation
import UIKit

final class CustomLabels: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        text = "FUNNY SOUNDS"
        textAlignment = .center
        textColor = #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
        font = UIFont(name: "Noteworthy-Bold", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

