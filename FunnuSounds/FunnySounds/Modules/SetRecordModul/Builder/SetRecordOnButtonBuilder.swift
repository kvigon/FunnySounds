//
//  SetRecordOnButtonBuilder.swift
//  FunnySounds
//
//  Created by Миша on 9/7/23.
//

import Foundation
import UIKit

final class SetRecordOnButtonBuilder {

    static func createSetRecordViewController(indexOfTrack: Int) -> UIViewController {
        let view = SetRecordOnButtonViewController()
        let presenter = SetRecordOnButtonPresenter(view: view)
        presenter.indexOfTrack = indexOfTrack
        view.presenter = presenter
        
        return view
    }
    
}
