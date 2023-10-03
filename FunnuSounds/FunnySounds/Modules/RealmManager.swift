//
//  RealmManager.swift
//  FunnySounds
//
//  Created by Миша on 9/7/23.
//

import Foundation
import RealmSwift

protocol DBManagerProtocol {
    
    func saveAudioModelToRealm(data: AudioModel)
    func deleteAudioModelFromRealm(model: AudioModel)
    func getAudioModelsFromRealm() -> [AudioModel]
    func assignActivityIndexToRecordByIndexOfTrack(activityIndex: Int, indexOfTrack: Int?)
}

final class RealManager: DBManagerProtocol {    
    
    func saveAudioModelToRealm(data: AudioModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(data)
            return data
        }
    }
    
    func deleteAudioModelFromRealm(model: AudioModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func getAudioModelsFromRealm() -> [AudioModel] {
        let realm = try! Realm()
        let resultModel = realm.objects(AudioModel.self)
        return Array (resultModel)
    }
    
    private func assignActivityIndexToModelInstanceInRealm(activityIndex: Int, indexOfTrack: Int?) {
        let audios = getAudioModelsFromRealm()
        guard let indexOfTrack = indexOfTrack else {return}
        let realm = try! Realm()
        try! realm.write {
            audios[indexOfTrack].activityIndex = activityIndex
        }
    }
    
    private func zeroingActivityIndexToRealm(activityIndex: Int) {
        let audios = getAudioModelsFromRealm()
        for item in audios {
            if item.activityIndex == activityIndex {
                let realm = try! Realm()
                try! realm.write {
                    item.activityIndex = 0
                }
            }
        }
    }
    
    func assignActivityIndexToRecordByIndexOfTrack(activityIndex: Int, indexOfTrack: Int?) {
        zeroingActivityIndexToRealm(activityIndex: activityIndex)
        assignActivityIndexToModelInstanceInRealm(activityIndex: activityIndex, indexOfTrack: indexOfTrack)
    }
}



