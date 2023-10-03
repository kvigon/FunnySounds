//
//  ListAudioBuilder.swift
//  FunnySounds
//
//  Created by Миша on 9/8/23.
//

import UIKit

protocol ListAudioBuilderProtocol {
    
    static func createListAudioViewController() -> UIViewController
}

class ListAudioBuilder: ListAudioBuilderProtocol {
    
    static func createListAudioViewController() -> UIViewController {
        
        let view = ListAudioViewController()
        let presenter = ListAudioPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
