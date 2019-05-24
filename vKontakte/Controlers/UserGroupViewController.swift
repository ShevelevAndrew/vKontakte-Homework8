//
//  UserGroupViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class UserGroupViewController: UITableViewController {

    var groupUser: [GroupModel] = [
        GroupModel(name: "Свистуны", image: UIImage(named: "group1")!),
        GroupModel(name: "Пивыны", image: UIImage(named: "group2")!),
        GroupModel(name: "Вязальщики", image: UIImage(named: "group2")!),
        GroupModel(name: "Рыболовы", image: UIImage(named: "group1")!),
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
 

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupUser.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let controller = segue.source as? SearchGroupViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow{
            let group = controller.groupUser[indexPath.row]
            
            guard !groupUser.contains(where:{ $0.name == group.name }) else { return }
            
            groupUser.append(group)
            let newIndexPath = IndexPath(item: groupUser.count - 1, section:  0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    }*/
    

}
