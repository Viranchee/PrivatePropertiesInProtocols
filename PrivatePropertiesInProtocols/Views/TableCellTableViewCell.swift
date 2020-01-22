//
//  TableCellTableViewCell.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell, UILabelSettable {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

// sourcery:inline:auto:TableCellTableViewCell.UILabelSettable
// MARK: - Sourcery UILabelSettable

        func setLabelText(_ text: String) {
            label.text = text
        }

        func getLabelText() -> String {
            return label.text ?? ""
        }
// sourcery:end
}
