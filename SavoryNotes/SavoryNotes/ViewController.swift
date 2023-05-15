//
//  ViewController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBAction func logoutButton(_ sender: UIButton) {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

