//
//  StartPresenter.swift
//  FunnySounds
//
//  Created by Миша on 9/6/23.
//

import Foundation
import AVFAudio
import AVFoundation
import UIKit
import RealmSwift

protocol StartViewPresenterProtocol {
    
    func playerStop()
    func startRecord()
    func initRecording()
    func checkRecordsOnPlayButtons()
    func playSoundOnButton(button: PlayButton, index: Int, title: String, indexPressedButton: Int)
    func playSound(activityIndex: Int)
    func addInfoAboutAudioModelToRealm(name: String)
}

final class StartPresenter: NSObject {
    
    private weak var view: StartViewController?
    private let dBManager: DBManagerProtocol = RealManager()
    private let storageManager: StorageManagerProtocol = StorageManager()
    private var indexPressedButton: Int = 0
    private var player: AVAudioPlayer?
    private var recordingSession: AVAudioSession!
    private var audioRecorder: AVAudioRecorder!
    private var currentAudioUUid = ""
    private var nameTrackfromTexrFieldAlert = ""
    
    init(view: StartViewController) {
        self.view = view
    }
}

extension StartPresenter: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            refreshButtonTitle()
        }
    }
}

private extension StartPresenter {
    
    func playByUrl(url: String) {
        let audioFilename = storageManager.getPathByUrl(urlString: url)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: audioFilename, fileTypeHint: AVFileType.m4a.rawValue)
            guard let player = player else { return }
            player.delegate = self
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func refreshButtonTitle() {
        if indexPressedButton == 1 {
            view?.contentView.playButtonOne.changeState(newState: .readyToPlay(title: "Play first"))
        }
        if indexPressedButton == 2 {
            view?.contentView.playButtonSecond.changeState(newState: .readyToPlay(title: "Play second"))
        }
        if indexPressedButton == 3 {
            view?.contentView.playButtonThird.changeState(newState: .readyToPlay(title: "Play third"))
        }
    }
    
    func startRecording() {
        currentAudioUUid = UUID().uuidString
        if audioRecorder == nil {
            let audioFilename = storageManager.getPathByUrl(urlString: currentAudioUUid)
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            do {
                audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                audioRecorder.record()
                view?.contentView.recordButton.setTitle("Stop", for: .normal)
            } catch {
                finishRecording(success: false)
            }
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        view?.contentView.recordButton.setTitle("Record", for: .normal)
        view?.enterNameOfRecord()
        view?.contentView.recordButton.setTitle(success ? "Record" : "Tap to Record", for: .normal)
    }
}

extension StartPresenter: StartViewPresenterProtocol {
    
    func startRecord() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func playerStop() {
        player?.stop()
    }
    
    func initRecording() {
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { allowed in
            }
        } catch {
        }
    }
    
    func checkRecordsOnPlayButtons() {
        let audios = dBManager.getAudioModelsFromRealm()
        var isHaveSoundOnFirstButton = false
        var isHaveSoundOnSecondButton = false
        var isHaveSoundOnThirdButton = false
        for item in audios {
            if item.activityIndex == 1 {
                isHaveSoundOnFirstButton = true
                view?.contentView.playButtonOne.changeState(newState: .readyToPlay(title: "Play first"))
            }
            if item.activityIndex == 2 {
                isHaveSoundOnSecondButton = true
                view?.contentView.playButtonSecond.changeState(newState: .readyToPlay(title: "Play second"))
            }
            if item.activityIndex == 3 {
                isHaveSoundOnThirdButton = true
                view?.contentView.playButtonThird.changeState(newState: .readyToPlay(title: "Play third"))
            }
        }
        if !isHaveSoundOnFirstButton {
            view?.contentView.playButtonOne.changeState(newState: .noData)
        }
        if !isHaveSoundOnSecondButton {
            view?.contentView.playButtonSecond.changeState(newState: .noData)
        }
        if !isHaveSoundOnThirdButton {
            view?.contentView.playButtonThird.changeState(newState: .noData)
        }
    }
    
    func playSoundOnButton(button: PlayButton, index: Int, title: String, indexPressedButton: Int) {
        self.indexPressedButton = indexPressedButton
        switch button.customState {
        case .noData:
            break
        case .readyToPlay(title: _):
            playSound(activityIndex: index)
            button.changeState(newState: .plaing)
        case .plaing:
            player?.stop()
            player = nil
            button.changeState(newState: .readyToPlay(title: title))
        }
    }
    
    func playSound(activityIndex: Int) {
        print("???? title \(activityIndex)")
        let audios = dBManager.getAudioModelsFromRealm()
        for item in audios {
            if item.activityIndex == activityIndex {
                playByUrl(url: item.audioUrl)
                print("URL \(item.audioUrl)")
            }
        }
    }
    
    func addInfoAboutAudioModelToRealm(name: String) {
        let track = AudioModel()
        track.audioUrl = currentAudioUUid
        print("!!!! \(self.currentAudioUUid)")
        track.title = name
        track.id = UUID().uuidString
        track.activityIndex = 0
        dBManager.saveAudioModelToRealm(data: track)
    }
}
