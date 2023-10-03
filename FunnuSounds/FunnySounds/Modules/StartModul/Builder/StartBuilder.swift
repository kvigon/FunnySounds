//
//  StartBuilder.swift
//  FunnySounds
//
//  Created by Миша on 9/7/23.
//

import Foundation
import UIKit

protocol StartBuilderProtocol {
    
    static func createStartViewController() -> UIViewController
}

class StartBuilder: StartBuilderProtocol {
    
    static func createStartViewController() -> UIViewController {
        let view = StartViewController()
        let presenter = StartPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}
  
