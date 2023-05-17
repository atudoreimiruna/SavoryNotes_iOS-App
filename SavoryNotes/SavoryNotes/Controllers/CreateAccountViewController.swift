//
//  CreateAccountViewController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password)
        {
            firebaseResult, error in
            if let error = error {
                var errorMessage = "An error occurred."
                
                switch error.localizedDescription {
                    case "The email address is already in use by another account.":
                        errorMessage = "The email address is already in use by another account. Please try again."
                    case "The password must be 6 characters long or more.":
                        errorMessage = "The password must be 6 characters long or more. Please try again."
                    case "The email address is badly formatted.":
                        errorMessage = "The email address is badly formatted. Please try again."
                    default:
                        errorMessage = "An error occurred. Please try again."
                    }
                
                let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
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
