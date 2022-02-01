//
//  ViewController.swift
//  iOS Setting UI
//
//  Created by Nilesh Kumar on 01/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var settingItemsName = [sectionsName]()
    
    private let myTable: UITableView = {
         let myTable = UITableView()
        return myTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.addSubview(myTable)
        myTable.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        myTable.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        myTable.delegate = self
        myTable.dataSource = self
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTable.frame = view.bounds
    }
    
    func configure(){
        
//        self.settingItemsName = Array(0...100).compactMap({
//            settingOptions(itemName: "item\($0)", iconImage: UIImage(systemName: "house"), iconBackgroundColor: .red) {
//
//            }
//        })
        
        self.settingItemsName.append(sectionsName(sectionTitle: "Section 1", sOptiones: [
            .staticCell(model: settingOptions(itemName: "House", iconImage: UIImage(systemName: "house"), iconBackgroundColor: .red, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Wifi", iconImage: UIImage(systemName: "wifi"), iconBackgroundColor: .blue, handler: {
                
            })),
            
                .switchCell(model: settingOptionsWithSwitch(itemName: "Airplane", iconImage: UIImage(systemName: "airplane"), iconBackgroundColor: .lightGray, switchOn: true, handler: {
                    
                } )),
            
            .staticCell(model: settingOptions(itemName: "Mobile Data", iconImage: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .purple, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Personal Hotspot", iconImage: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .yellow, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Mic", iconImage: UIImage(systemName: "mic"), iconBackgroundColor: .green, handler: {
                
            }))
          
        ]))
        
        self.settingItemsName.append(sectionsName(sectionTitle: "Section 2", sOptiones: [
            .staticCell(model: settingOptions(itemName: "Heart", iconImage: UIImage(systemName: "heart"), iconBackgroundColor: .red, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Clock", iconImage: UIImage(systemName: "clock"), iconBackgroundColor: .blue, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Bag", iconImage: UIImage(systemName: "bag"), iconBackgroundColor: .purple, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Alt", iconImage: UIImage(systemName: "alt"), iconBackgroundColor: .yellow, handler: {
                
            })),
            .staticCell(model: settingOptions(itemName: "Drop", iconImage: UIImage(systemName: "drop"), iconBackgroundColor: .green, handler: {
                
            }))
          
        ]))
        
    self.settingItemsName.append(sectionsName(sectionTitle: "Section 3", sOptiones: [
        .staticCell(model: settingOptions(itemName: "House", iconImage: UIImage(systemName: "house"), iconBackgroundColor: .red, handler: {
            
        })),
                    .staticCell(model: settingOptions(itemName: "Bolt", iconImage: UIImage(systemName: "bolt"), iconBackgroundColor: .blue, handler: {
            
        })),
        .staticCell(model: settingOptions(itemName: "Pencil", iconImage: UIImage(systemName: "pencil"), iconBackgroundColor: .purple, handler: {
            
        })),
        .staticCell(model: settingOptions(itemName: "item4", iconImage: UIImage(systemName: "house"), iconBackgroundColor: .yellow, handler: {
            
        })),
        .staticCell(model: settingOptions(itemName: "item5", iconImage: UIImage(systemName: "house"), iconBackgroundColor: .green, handler: {
            
        }))
      
    ]))
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingItemsName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingItemsName[section].sOptiones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settingItemsName[indexPath.section].sOptiones[indexPath.row]
        
        switch model.self {
        case .staticCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            cell.config(with: model)
            return cell
        case .switchCell(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.config(with: model)
            return cell
        }
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = settingItemsName[section]
        return sectionTitle.sectionTitle
    }
}
