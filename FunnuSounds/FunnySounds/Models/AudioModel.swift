//
//  AudioModel.swift
//  Lena
//
//  Created by Миша on 7/4/23.
//

import Foundation
import RealmSwift

final class AudioModel : Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var title: String?
    @objc dynamic var activityIndex: Int = 0
    @objc dynamic var audioUrl: String = ""
}
