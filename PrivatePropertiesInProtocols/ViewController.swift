//
//  ViewController.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    typealias VideoCell = GenericTableViewCell<LabelView>
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.registerCell(VideoCell.self)
        
        view.addSubview(tableView)
        tableView.pinEdgesToSuperview()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = VideoCell()
        return cell
    }
}
