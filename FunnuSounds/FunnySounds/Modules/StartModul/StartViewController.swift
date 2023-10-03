//
//  ViewController.swift
//  FunnySounds
//
//  Created by Миша on 7/4/23.

import SnapKit
import UIKit
import AVFoundation
import RealmSwift

final class StartViewController: UIViewController, AVAudioRecorderDelegate {
    
    var presenter: StartViewPresenterProtocol!
    private(set) var contentView = StartViewContent()
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.initRecording()
        addActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.checkRecordsOnPlayButtons()
    }
    
    func enterNameOfRecord() {
        let addNameTrack = UIAlertController(
            title: "Enter name",
            message: nil,
            preferredStyle: .alert
        )
        addNameTrack.addTextField()
        let submitAction = UIAlertAction(
            title: "OK",
            style: .default
        )
        { [weak self, unowned addNameTrack] _ in
            guard let self else { return }
            self.textFieldName(addNameTrack: addNameTrack, nameText: addNameTrack.textFields?[0].text)
        }
        addNameTrack.addAction(submitAction)
        present(addNameTrack, animated: true)
    }
}

private extension StartViewController {
    func addActions() {
        contentView.playListButton.addTarget(self, action: #selector(goToPlayList), for: .touchUpInside)
        contentView.playButtonOne.addTarget(self, action: #selector(playSoundFirst), for: .touchUpInside)
        contentView.playButtonSecond.addTarget(self, action: #selector(playSoundSecond), for: .touchUpInside)
        contentView.playButtonThird.addTarget(self, action: #selector(playSoundThird), for: .touchUpInside)
        contentView.recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
    }
    
    func textFieldName(addNameTrack: UIAlertController, nameText: String?) {
        guard let nameText else {
            present(addNameTrack, animated: true)
            return
        }
        presenter.addInfoAboutAudioModelToRealm(name: nameText)
    }
}

@objc
private extension StartViewController {
    
    func goToPlayList() {
        let vc = ListAudioBuilder.createListAudioViewController()
        present(vc, animated: true)
    }
    
    func recordTapped() {
        contentView.animatedButton(button: contentView.recordButton)
        presenter.startRecord()
    }
    
    func stopPlaing() {
        presenter.playerStop()
    }
    
    func playSoundFirst() {
        contentView.animatedButton(button: contentView.playButtonOne)
        presenter.playSoundOnButton(button: contentView.playButtonOne,
                                    index: 1,
                                    title: "Play first",
                                    indexPressedButton: 1)
    }
    
    func playSoundSecond() {
        contentView.animatedButton(button: contentView.playButtonSecond)
        presenter.playSoundOnButton(button: contentView.playButtonSecond,
                                    index: 2,
                                    title: "Play second",
                                    indexPressedButton: 2)
    }
    
    func playSoundThird() {
        contentView.animatedButton(button: contentView.playButtonThird)
        presenter.playSoundOnButton(button: contentView.playButtonThird,
                                    index: 3,
                                    title: "Play third",
                                    indexPressedButton: 3)
    }
    
}
