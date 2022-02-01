//
//  Models.swift
//  Models
//
//  Created by Nilesh Kumar on 02/02/22.
//

import Foundation
import UIKit

struct settingOptions {
    let itemName: String
    let iconImage: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()-> Void)
}

struct settingOptionsWithSwitch {
    let itemName: String
    let iconImage: UIImage?
    let iconBackgroundColor: UIColor
    var switchOn: Bool
    let handler: (()-> Void)
}

struct sectionsName {
    let sectionTitle: String
    let sOptiones: [settingsOptionType]
}

enum settingsOptionType{
    case staticCell(model: settingOptions)
    case switchCell(model: settingOptionsWithSwitch)
}
