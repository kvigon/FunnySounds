//
//  SetViewController.swift
//  FunnySounds
//
//  Created by Миша on 7/4/23.
//

import SnapKit
import UIKit
import AVFoundation
import RealmSwift

final class SetRecordOnButtonViewController: UIViewController {
    
    var presenter: SetRecordOnButtonViewPresenterProtocol?
    private(set) var contentView: SetRecordOnButtonContentView = SetRecordOnButtonContentView()
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActions()
    }
}

@objc
private extension SetRecordOnButtonViewController {
    
    func setSoundFirst() {
        presenter?.setSoundOnButton(index: 1)
        dismiss(animated: true)
    }
    
    func setSoundSecond() {
        presenter?.setSoundOnButton(index: 2)
        dismiss(animated: true)
    }
    
    func setSoundThird() {
        presenter?.setSoundOnButton(index: 3)
        dismiss(animated: true)
    }
}

private extension SetRecordOnButtonViewController {
    
    func addActions() {
        contentView.setButtonOne.addTarget(self, action: #selector(setSoundFirst), for: .touchUpInside)
        contentView.setButtonSecond.addTarget(self, action: #selector(setSoundSecond), for: .touchUpInside)
        contentView.setButtonThird.addTarget(self, action: #selector(setSoundThird), for: .touchUpInside)
    }
}
