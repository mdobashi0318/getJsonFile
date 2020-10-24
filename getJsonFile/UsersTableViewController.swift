//
//  ViewController.swift
//  getJsonFile
//
//  Created by 土橋正晴 on 2020/10/24.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var model:[UsersModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        model = UsersModel.fetchUsers()
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?[section].childUsers?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let model = model {
            print(model[indexPath.row])
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = model?[indexPath.section].childUsers?[indexPath.row].name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model?[section].name
    }
    
}



