//
//  MyFriendsViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class MyFriendsViewController: UITableViewController, UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
  
    var friendDictionary = [String:[FriendsModel]]()
    var friendSectionTitle = [String]()
    
    var friends: [FriendsModel] = [
        FriendsModel(name: "Василий", image: UIImage(named: "user1")!, likeCount: "1"),
        FriendsModel(name: "Александр", image: UIImage(named: "user1")!, likeCount: "12"),
        FriendsModel(name: "Светлана", image: UIImage(named: "user2")!, likeCount: "13"),
        FriendsModel(name: "Сергей", image: UIImage(named: "user1")!, likeCount: "14"),
        FriendsModel(name: "Мария", image: UIImage(named: "user2")!, likeCount: "15"),
        FriendsModel(name: "Ася", image: UIImage(named: "user2")!, likeCount: "16"),
        FriendsModel(name: "Петр", image: UIImage(named: "user1")!, likeCount: "17"),
        FriendsModel(name: "Ольга", image: UIImage(named: "user2")!, likeCount: "18"),
        FriendsModel(name: "Тимофей", image: UIImage(named: "user1")!, likeCount: "19"),
        FriendsModel(name: "Андрей", image: UIImage(named: "user3")!, likeCount: "10"),
        FriendsModel(name: "Елисей", image: UIImage(named: "user1")!, likeCount: "19")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setArray()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomTableViewCell.reuseId)
        tableView.dataSource = self
    }
    
    private func setArray() {
        friends = friends.sorted(by: {$0.name < $1.name})
        for friend in friends {
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = friendDictionary[friendKey] {
                friendValues.append(friend)
                friendDictionary[friendKey] = friendValues
            } else {
                friendDictionary[friendKey] = [friend]
            }
        }
        friendSectionTitle = [String](friendDictionary.keys)
        friendSectionTitle = friendSectionTitle.sorted(by: {$0 < $1})
    }
 
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friendKey = friendSectionTitle[section]
        if let friendValues = friendDictionary[friendKey] {
            return friendValues.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseId, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
  
        let friendKey = friendSectionTitle[indexPath.section]
        if let friendValues = friendDictionary[friendKey] {
            cell.nameLabel.text = friendValues[indexPath.row].name
            cell.friendImageView.image = friendValues[indexPath.row].image
        }
        return cell
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSectionTitle.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSectionTitle
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSectionTitle[section]
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor(red: 53.0/255.0, green: 155.0/255.0, blue: 220.0/255.0, alpha: 0.9)
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-30, height: headerView.frame.height-30)
        
        let friendKey = friendSectionTitle[section]
        label.text = friendKey
     
        headerView.addSubview(label)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ForcastSeque", sender: nil)
    }
    
    // MARK: - Navigation
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ForcastSeque",
        let forecastController = segue.destination as? FriendsCollectionViewController,
        let indexPath = tableView.indexPathForSelectedRow {
 
        let friendKey = friendSectionTitle[indexPath.section]
        
        if let friendValues = friendDictionary[friendKey] {
            forecastController.friendNameForTitle = friendValues[indexPath.row].name
            forecastController.friendNameForLabel = friendValues[indexPath.row].name
            forecastController.friendNameForImage = friendValues[indexPath.row].image
            forecastController.likeCount = friendValues[indexPath.row].likeCount
        }
    }
 }
}
// MARK: - Extension

