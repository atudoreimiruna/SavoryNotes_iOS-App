//
//  LoginViewController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password)
        {
            firebaseResult, error in
            if let e = error {
                print("error")
            }
            else {
                // Go to homescreen
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
        
    }
    
    @objc func showPasswordButtonTapped() {
            passwordTextField.isSecureTextEntry.toggle()
            if passwordTextField.isSecureTextEntry {
                showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            } else {
                showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
