//
//  ListAudioTableViewCell.swift
//  FunnySounds
//
//  Created by Миша on 7/4/23.
//

import Foundation
import UIKit

final class ListAudioTableViewCell : UITableViewCell {
    
    private let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Noteworthy-Bold", size: 20)
        title.textColor = .systemPink
        
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubviews()
        makeConstreint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(item: AudioModel) {
        title.text = item.title
    }
    
    private func addSubviews() {
        contentView.addSubview(title)
    }
    
    private func makeConstreint() {
        NSLayoutConstraint.activate(
            [
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                title.heightAnchor.constraint(equalToConstant: 75)
            ]
        )
    }
}

