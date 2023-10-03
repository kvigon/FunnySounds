//
//  ListAudioViewPresenter.swift
//  FunnySounds
//
//  Created by Миша on 9/6/23.
//

import Foundation
import UIKit


protocol ListAudioViewPresenterProtocol {
    
    func reallyDelete(index: Int)
    func numberOfRows() -> Int
    func getItems()-> [AudioModel]
}

class ListAudioPresenter {
    
    private weak var view: ListAudioViewController?
    
    required init(view: ListAudioViewController) {
        self.view = view
    }
    
    private let dBManager: DBManagerProtocol = RealManager()
    private let storageManager: StorageManagerProtocol = StorageManager()
    
}

extension ListAudioPresenter: ListAudioViewPresenterProtocol {
    
    func reallyDelete(index: Int) {
        let urlString = dBManager.getAudioModelsFromRealm()[index].audioUrl
        dBManager.deleteAudioModelFromRealm(model: dBManager.getAudioModelsFromRealm()[index])
        storageManager.deleteRecordFromStorage(urlString: urlString)
        view?.contentView.customTableView.reloadData()
    }
    
    func numberOfRows() -> Int {
        dBManager.getAudioModelsFromRealm().count
    }
    
    func getItems() -> [AudioModel] {
        dBManager.getAudioModelsFromRealm()
    }
    
}

