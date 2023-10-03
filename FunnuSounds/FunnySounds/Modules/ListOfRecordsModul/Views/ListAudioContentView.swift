//
//  ListAudioContentView.swift
//  FunnySounds
//
//  Created by Миша on 7/22/23.
//

import UIKit

final class ListAudioContentView: UIView {
    
    let customTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundView = UIImageView(image: UIImage(named: "ListVCBackground.png"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        tableView.allowsSelection = true
        
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(customTableView)
    }
    
    private func makeConstrains() {
        NSLayoutConstraint.activate(
            [
                customTableView.topAnchor.constraint(equalTo: topAnchor),
                customTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                customTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                customTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
    
}
