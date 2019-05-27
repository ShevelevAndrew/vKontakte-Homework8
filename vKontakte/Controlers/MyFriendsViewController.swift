//
//  MyFriendsViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class MyFriendsViewController: UITableViewController {
   
    
    var friends: [FriendsModel] = [
        FriendsModel(name: "Василий", image: UIImage(named: "user1")!),
        FriendsModel(name: "Марина", image: UIImage(named: "user2")!),
        FriendsModel(name: "Светлана", image: UIImage(named: "user2")!),
        FriendsModel(name: "Сергей", image: UIImage(named: "user1")!),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.reuseIdentifier, for: indexPath) as?
            FriendsCell else { return UITableViewCell() }
        
        cell.friendNameLabel.text = friends[indexPath.row].name
       
        cell.friendImageView.addShadow(offset: CGSize.init(width: 5, height: 5.0), color: UIColor.black, radius: 2.0, opacity: 0.4)

        cell.addBorderAndImage(imageView: cell.friendImageView, image: friends[indexPath.row].image, frame: cell.friendImageView.bounds,
                       cornerRadius: 20, borderColor: UIColor.black.cgColor, borderWidth: 1)
        
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

 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ForcastSeque",
        let forecastController = segue.destination as? FriendsCollectionViewController,
        let indexPath = tableView.indexPathForSelectedRow {
 
        let friendName = friends[indexPath.row].name
        forecastController.friendNameForTitle = friendName
        forecastController.friendNameForLabel = friendName
        forecastController.friendNameForImage = friends[indexPath.row].image
    }
 
 }
  
}
extension UIView {
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
    
    func addBorderAndImage(imageView: UIImageView, image: UIImage, frame: CGRect, cornerRadius: CGFloat, borderColor: CGColor, borderWidth: CGFloat)  {
        let borderView = UIView()
        borderView.layer.frame = frame
        borderView.layer.cornerRadius = cornerRadius
        borderView.layer.borderColor = borderColor
        borderView.layer.borderWidth = borderWidth
        borderView.layer.masksToBounds = true
        imageView.addSubview(borderView)
        
        let otherSubContent = UIImageView()
        otherSubContent.image = image
        otherSubContent.frame = borderView.bounds
        borderView.addSubview(otherSubContent)
    }
}


