//
//  VideoPlayableViewController.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit

protocol VideoPlayableViewController: class {
    var currentItemIndexPath: IndexPath? { get set }
    func playVideo(with options: VideoPlayerOptions?)
    func pauseVideo() -> VideoPlayerOptions
}

protocol VideoPlayableTableViewController: VideoPlayableViewController {
    var tableView: UITableView { get }
    func autoPlayVideosIn(tableView: UITableView)
}

extension VideoPlayableTableViewController {
    func autoPlayVideosIn(tableView: UITableView) {
        let visibleCellPaths = tableView.indexPathsForVisibleRows ?? []
        let playableCellPaths = visibleCellPaths.filter { (indexPath) -> Bool in
            return tableView.cellForRow(at: indexPath) is VideoPlayable
        }
        
        let toPlayCell = playableCellPaths.first { (indexPath) -> Bool in
            let cellRect = tableView.rectForRow(at: indexPath)
            let currentHeight = cellRect.intersection(tableView.bounds).height
            let cellAdjustedHeight = cellRect.height * 0.6
            return currentHeight >= cellAdjustedHeight
        }
        
        switch (toPlayCell, currentItemIndexPath) {
        case let (toPlay?, current) where toPlay != current:
            guard let toPlayPlayer = tableView.cellForRow(at: toPlay) as? VideoPlayable
                else { return }
            let currentPlayer = current.flatMap(tableView.cellForRow(at:)) as? VideoPlayable
            toPlayPlayer.startPlayback(with: VideoPlayerOptions(isMuted: true, startTime: .zero))
            currentPlayer?.stopPlayback()
            currentItemIndexPath = toPlay
        case let (toPlay?, current) where toPlay == current:
            break
        case let (nil, current):
            let currentPlayer = current.flatMap(tableView.cellForRow(at:)) as? VideoPlayable
            currentPlayer?.stopPlayback()
            currentItemIndexPath = nil
        
        case (.some(_), _):
            fatalError("All Cases should be covered and this path should not be reached")
        }
    }

}
