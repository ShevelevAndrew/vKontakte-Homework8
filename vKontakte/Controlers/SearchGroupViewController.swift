//
//  SearchGroupViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class SearchGroupViewController: UITableViewController {

    var groupUser: [GroupModel] = [
        GroupModel(name: "Космос", image: UIImage(named: "group1")!),
        GroupModel(name: "Океан", image: UIImage(named: "group2")!),
        GroupModel(name: "Растения", image: UIImage(named: "group2")!),
        GroupModel(name: "Облака", image: UIImage(named: "group1")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupUser.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroopCell.reuseIdentifier, for: indexPath) as?
            GroopCell else { return UITableViewCell() }
        
        cell.groopNameLabel.text = groupUser[indexPath.row].name
        cell.groopImageView.image = groupUser[indexPath.row].image

        return cell
    }
  
    // MARK: - Navigation

}
