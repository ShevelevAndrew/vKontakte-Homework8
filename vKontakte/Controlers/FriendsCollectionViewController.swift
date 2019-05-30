//
//  FriendsCollectionViewController.swift
//  vKontakte
//
//  Created by Andrew on 19/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class FriendsCollectionViewController: UICollectionViewController {

    var friendNameForTitle: String = ""
    var friendNameForLabel: String = ""
    var friendNameForImage: UIImage = UIImage(named: "user")!
    
    var likeCount: String = ""
    weak var likeCountLabel: UILabel!
    weak var likeButton: Likebutton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = friendNameForTitle
        
        

    }

    override func viewDidAppear(_ animated: Bool) {
        likeButton.addTarget(self, action: #selector(likeButtonDidtapped), for: .valueChanged)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForcastCell.reuseIdentifier, for: indexPath) as?
        ForcastCell else { return UICollectionViewCell() }
        
        cell.friendNameLabel.text = "Friend " + friendNameForLabel
        cell.friendImageView.image = friendNameForImage
        
        cell.likeCount.text = likeCount
        likeButton = cell.likeButton
        likeCountLabel = cell.likeCount
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    @objc func likeButtonDidtapped() {

        if likeButton.isLaiked {
            likeCountLabel.text = String(Int(likeCount)! + 1)
        } else {
            likeCountLabel.text = String(Int(likeCountLabel.text!)! - 1)
        }
        
    }

}


class Likebutton: UIControl {
    
    var isLaiked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let sideOne = rect.height * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne * sideOne + sideTwo * sideTwo) / 2
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: rect.height * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        path.addArc(withCenter: CGPoint(x: rect.height * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        
        path.addLine(to: CGPoint(x: rect.height * 0.5, y: rect.height * 0.95))
        
        path.close()
        
        UIColor.red.setStroke()
        UIColor.red.setFill()
        
        
        isLaiked ? path.fill() : path.stroke()
    }
    
    func setupView() {
        self.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        //self.backgroundColor = UIColor.gray
        self.layer.cornerRadius = min(self.bounds.height, self.bounds.width) / 5
        clipsToBounds = true
        
    }
    
    
    
    @objc func changeState() {
        isLaiked.toggle()
        self.sendActions(for: .valueChanged)
        setNeedsDisplay() // после изменения перересовать
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180}
}
