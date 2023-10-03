//
//  ListAudioViewController.swift
//  FunnySounds
//
//  Created by Миша on 7/4/23.
//

import Foundation
import UIKit
import AVFoundation
import RealmSwift

final class ListAudioViewController: UIViewController {
    
    var presenter: ListAudioViewPresenterProtocol!
    
    private(set) var contentView = ListAudioContentView()

    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
    }
}

extension ListAudioViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell") as! ListAudioTableViewCell
        cell.setData(item:presenter.getItems()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(
            style: .destructive,
            title: "Delete"
        ) { [weak self] (action, sourceView, completionHandler) in
            guard let self else { return }
            deleteFromTableView(index: indexPath.row, completionHandler: completionHandler)
        }
        delete.title = "Delete"
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        swipeAction.performsFirstActionWithFullSwipe = true
        return swipeAction
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SetRecordOnButtonBuilder.createSetRecordViewController(indexOfTrack: indexPath.row)
        present(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension ListAudioViewController {
    private func deleteFromTableView(index: Int, completionHandler: @escaping (Bool) -> Void) {
        let deleteTrack = UIAlertController(
            title: "Really delete?",
            message: nil,
            preferredStyle: .alert
        )
        let submitAction = UIAlertAction(
            title: "OK",
            style: .default
        ) { [weak self] _ in
            guard let self else { return }
            presenter.reallyDelete(index: index)
        }
        deleteTrack.addAction(submitAction)
        present(deleteTrack, animated: true)
        completionHandler(true)
    }
    
    private func setupTableView() {
        contentView.customTableView.delegate = self
        contentView.customTableView.dataSource = self
        contentView.customTableView.register(ListAudioTableViewCell.self, forCellReuseIdentifier: "trackCell")
    }
    
}

