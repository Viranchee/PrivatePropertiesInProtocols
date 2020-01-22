//
//  LabelSettable.swift
//  PrivatePropertiesInProtocols
//
//  Created by Viranchee L on 22/01/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import UIKit
import AVFoundation

protocol LabelSettable: class {
    func setLabelText(_ text: String)
    func getLabelText() -> String
}

protocol UILabelSettable: LabelSettable {
//    var label: UILabel! { get }
}

extension UILabelSettable {
//    func setLabelText(_ text: String) {
//        label.text = text
//    }
//
//    func getLabelText() -> String {
//        return label.text ?? ""
//    }
}
