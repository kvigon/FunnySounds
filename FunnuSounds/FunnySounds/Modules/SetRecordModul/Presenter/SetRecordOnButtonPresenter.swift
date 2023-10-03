//
//  SetRecordOnButtonPresenter.swift
//  FunnySounds
//
//  Created by Миша on 9/6/23.
//

import Foundation
import AVFAudio

protocol SetRecordOnButtonViewPresenterProtocol {
    
    func setSoundOnButton(index: Int)
}

final class SetRecordOnButtonPresenter {
    
    var indexOfTrack: Int?
    private weak var view: SetRecordOnButtonViewController?
    private let model: AudioModel = AudioModel()
    private let dBManager: DBManagerProtocol = RealManager()
    
    init(view: SetRecordOnButtonViewController) {
        self.view = view
    }    
}

extension SetRecordOnButtonPresenter: SetRecordOnButtonViewPresenterProtocol {
    
    func setSoundOnButton(index: Int) {
        dBManager.assignActivityIndexToRecordByIndexOfTrack(activityIndex: index, indexOfTrack: indexOfTrack)
    }
    
}






