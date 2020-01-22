//
//  TableViewExtension.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        let cellName = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: cellName)
    }
    
    func registerNib<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        let cellName = String(describing: cellClass)
        register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error for cell id: \(identifier) at \(indexPath)")
        }
        return cell
    }
    
    func registerHeader<Header: UITableViewHeaderFooterView>(_ headerClass: Header.Type) {
        let headerName = String(describing: headerClass)
        register(headerClass, forHeaderFooterViewReuseIdentifier: headerName)
    }
    
    func registerHeaderNib<Header: UITableViewHeaderFooterView>(_ headerClass: Header.Type) {
        let nibName = String(describing: headerClass)
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: nibName)
    }
    
    func dequeueReusableHeader<Header: UITableViewHeaderFooterView>() -> Header {
        let identifier = String(describing: Header.self)
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Header else {
            fatalError("Error for header id: \(identifier)")
        }
        return header
        
    }
    
}

class GenericTableViewCell<View: UIView>: UITableViewCell {
    var cellView: View? {
        didSet {
            guard cellView != nil else { return }
            setupViews()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        guard let cellView = cellView else { return }
        addSubview(cellView)
    }
}
