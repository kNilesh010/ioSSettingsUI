//
//  SwitchTableViewCell.swift
//  SwitchTableViewCell
//
//  Created by Nilesh Kumar on 02/02/22.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"
    
    private let myView: UIView = {
        let myView = UIView()
        myView.clipsToBounds = true
        myView.layer.cornerRadius = 10
        myView.layer.masksToBounds = true
        return myView
    }()
    
    private let myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFit
        myImageView.tintColor = .white
        return myImageView
    }()
    
    private let myLabel: UILabel = {
        let myLabel = UILabel()
        return myLabel
    }()
    
    private let switchCell: UISwitch = {
        let switchCell = UISwitch()
        return switchCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myView)
        contentView.addSubview(myLabel)
        contentView.addSubview(switchCell)
        myView.addSubview(myImageView)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func config(with model: settingOptionsWithSwitch){
        myImageView.image = model.iconImage
        myLabel.text = model.itemName
        myView.backgroundColor = model.iconBackgroundColor
        switchCell.isOn = model.switchOn
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        myLabel.text = nil
        myView.backgroundColor = nil
        switchCell.isOn = false
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let mySize = contentView.frame.size.height - 10
        myView.frame = CGRect(x: 20, y: 5, width: mySize, height: mySize)
        
        let myImageSize = mySize/1.4
        
        myImageView.frame = CGRect(x: (mySize - myImageSize) / 2, y: (mySize - myImageSize) / 2, width: myImageSize, height: myImageSize)
       // myImageView.center = myView.center
        
        switchCell.sizeToFit()
        switchCell.frame = CGRect(x: contentView.frame.size.width - switchCell.frame.size.width - 20, y: (contentView.frame.size.height - switchCell.frame.size.height) / 2, width: switchCell.frame.size.width, height: switchCell.frame.size.height)
        
        myLabel.frame = CGRect(x: 25 + myView.frame.size.width, y: 0, width: contentView.frame.size.width + 25 + myView.frame.size.width, height: contentView.frame.size.height)
        
        
    }
    
}
