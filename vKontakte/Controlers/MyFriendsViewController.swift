//
//  MyFriendsViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class MyFriendsViewController: UITableViewController {
  
    //var tableViewData = [String]()
    //var indexes = [String]()

    
    var friends: [FriendsModel] = [
        FriendsModel(name: "Василий", image: UIImage(named: "user1")!, likeCount: "1"),
        FriendsModel(name: "Александр", image: UIImage(named: "user3")!, likeCount: "12"),
        FriendsModel(name: "Светлана", image: UIImage(named: "user2")!, likeCount: "13"),
        FriendsModel(name: "Сергей", image: UIImage(named: "user1")!, likeCount: "14"),
        FriendsModel(name: "Мария", image: UIImage(named: "user2")!, likeCount: "15"),
        FriendsModel(name: "Ася", image: UIImage(named: "user2")!, likeCount: "16"),
        FriendsModel(name: "Петр", image: UIImage(named: "user1")!, likeCount: "17"),
        FriendsModel(name: "Ольга", image: UIImage(named: "user2")!, likeCount: "18"),
        FriendsModel(name: "Тимофей", image: UIImage(named: "user1")!, likeCount: "19"),
        FriendsModel(name: "Андрей", image: UIImage(named: "user1")!, likeCount: "10"),
        FriendsModel(name: "Елисей", image: UIImage(named: "user1")!, likeCount: "19")
    ]
    //var friendsSorted: [FriendsModel]
    var friendDictionary = [String:[FriendsModel]]()
    var friendSectionTitle = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.reuseIdentifier, for: indexPath) as?
            FriendsCell else { return UITableViewCell() }
  
        let friendKey = friendSectionTitle[indexPath.section]
        if let friendValues = friendDictionary[friendKey] {
            cell.friendNameLabel.text = friendValues[indexPath.row].name
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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




