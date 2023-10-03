//
//  StorageManager.swift
//  FunnySounds
//
//  Created by Миша on 9/7/23.
//

import Foundation

protocol StorageManagerProtocol {
    
    func deleteRecordFromStorage(urlString: String)
    func getPathByUrl(urlString: String ) -> URL
}

final class StorageManager: StorageManagerProtocol {
    
    private func getDocumentsDirectory() -> URL {
        _ = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        do {
            let recordsFolderPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Records")
            if !FileManager.default.fileExists(atPath: recordsFolderPath.absoluteString) {
                try! FileManager.default.createDirectory(at: recordsFolderPath, withIntermediateDirectories: true, attributes: nil)
            }
            let customRecordFolderPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Records")
            if !FileManager.default.fileExists(atPath: customRecordFolderPath.absoluteString) {
                try! FileManager.default.createDirectory(at: customRecordFolderPath, withIntermediateDirectories: true, attributes: nil)
            }
            print("директори \(customRecordFolderPath)")
            return customRecordFolderPath
        }
    }
    
    func deleteRecordFromStorage(urlString: String) {
        let path = getDocumentsDirectory().appendingPathComponent("\(urlString).m4a")
        try! FileManager.default.removeItem(at: path)
    }
    
    func getPathByUrl(urlString: String ) -> URL {
        getDocumentsDirectory().appendingPathComponent("\(urlString).m4a")
    }
}
