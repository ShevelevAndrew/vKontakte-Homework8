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
    

   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ForcastSeque",
            let forecastController = segue.destination as? ForcastCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            let cityName = cities[indexPath.row].name
            forecastController.cityNameFoerTitle = cityName
        }
        
    } */
    

}
