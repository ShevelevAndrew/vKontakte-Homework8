//
//  LauncheControler.swift
//  vKontakte
//
//  Created by Andrew on 14/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class LauncheControler: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var titlrLabel: UILabel!
    @IBOutlet weak var userNametext: UITextField!
    @IBOutlet weak var userPassText: UITextField!
    
    //MARK: - Actions
    
    @IBAction func unwinSegue(unwindSegue: UIStoryboardSegue){
        // при нажатии на крестик
        
    }
    
    @IBAction func loginButtonPress(_ sender: UIButton) {
       checkTextField()
    }
    
    
    func checkTextField(){
        if userNametext.text == "",
            userPassText.text == "" {
            print("Suces ok")
            performSegue(withIdentifier: "showTabBarContoller", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorect LoginName or Password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.userPassText.text = ""
            }
            alert.addAction(action)
            present(alert, animated: true)
            
        }
    }
    
    //MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeybordGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrolView?.addGestureRecognizer(hideKeybordGesture)
        
        animations()
    }
    
    private func animations() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.titlrLabel.layer.add(animation, forKey: nil)
        self.userNametext.layer.add(animation, forKey: nil)
        self.userPassText.layer.add(animation, forKey: nil)
        self.loginButton.layer.add(animation, forKey: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWasShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Keybord
    
   @objc func keybordWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsert = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
        self.scrolView?.contentInset = contentInsert
        scrolView?.scrollIndicatorInsets = contentInsert
    }
    
    @objc func keybordWillBeHidden(notification: Notification) {
       let contentInsets = UIEdgeInsets.zero
        self.scrolView?.contentInset = contentInsets
        scrolView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard(){
       self.scrolView.endEditing(true)
    }
    
    //MARK: - Segues
}

