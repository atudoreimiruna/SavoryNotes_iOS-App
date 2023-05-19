//
//  CreateRecipeController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit
import AVFAudio


class CreateRecipeController : UIViewController {
    
    private var audioPlayer: AVAudioPlayer?
    
    let prettyPlease = UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0)
    let youngSalmon = UIColor(red: 255/255, green: 184/255, blue: 184/255, alpha: 1.0)
    let electricBlue = UIColor(red: 126/255, green: 255/255, blue: 245/255, alpha: 1.0)
    let hammamBlue = UIColor(red: 103/255, green: 230/255, blue: 220/255, alpha: 1.0)
    let creamyPeach = UIColor(red: 243/255, green: 166/255, blue: 131/255, alpha: 1.0)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "Create a new recipe"
        label.textAlignment = .center
        return label
    }()
    
    private let itemTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 10
        tf.placeholder="Title"
        return tf
    }()
    
    private let typeTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.placeholder = "Category"
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private let descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.placeholder = "Description"
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private let timeTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.placeholder = "Preparation time"
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private let ingTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.placeholder = "Ingredients"
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create item", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.backgroundColor = creamyPeach
        button.addTarget(self, action: #selector(createItemPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
     override func viewDidLoad() {
        super.viewDidLoad()
         
        configureUI()
        configureAudioPlayer()
    }
    
    @objc func createItemPressed() {
        guard let recipeText = itemTextField.text, !recipeText.isEmpty else {
               displayErrorAlert(message: "Title is required")
               return
           }
           
           guard let recipeType = typeTextField.text, !recipeType.isEmpty else {
               displayErrorAlert(message: "Category is required")
               return
           }
           
           guard let descriptionType = descriptionTextField.text, !descriptionType.isEmpty else {
               displayErrorAlert(message: "Description is required")
               return
           }
           
           guard let ingredientsType = ingTextField.text, !ingredientsType.isEmpty else {
               displayErrorAlert(message: "Ingredients is required")
               return
           }
           
           guard let timeType = timeTextField.text, !timeType.isEmpty else {
               displayErrorAlert(message: "Preparation time is required")
               return
           }

        PostService.shared.uploadRecipeItem(text: recipeText, text2: recipeType, text3: descriptionType, text4: ingredientsType, text5: timeType) { (err, ref) in
            self.itemTextField.text = ""
            self.typeTextField.text = ""
            self.descriptionTextField.text = ""
            self.ingTextField.text = ""
            self.timeTextField.text = ""
            
            let alertController = UIAlertController(title: "Success", message: "Recipe added!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            self.playSuccessSound()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func playSuccessSound() {
        audioPlayer?.play()
    }
    
    private func displayErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func configureAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "button-124476", withExtension: "mp3") else {
            print("Failed to find sound file")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
    
    
    func configureUI() {
        view.backgroundColor = youngSalmon
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(itemTextField)
        itemTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 130, paddingLeft: 16, paddingRight: 16, height: 40)
        itemTextField.delegate = self
        
        view.addSubview(typeTextField)
        typeTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 200, paddingLeft: 16, paddingRight: 16, height: 40)
        typeTextField.delegate = self
        
        view.addSubview(descriptionTextField)
        descriptionTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 270, paddingLeft: 16, paddingRight: 16, height: 120)
        descriptionTextField.delegate = self
        
        view.addSubview(ingTextField)
        ingTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 410, paddingLeft: 16, paddingRight: 16, height: 40)
        ingTextField.delegate = self
        
        view.addSubview(timeTextField)
        timeTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 480, paddingLeft: 16, paddingRight: 16, height: 40)
        timeTextField.delegate = self
        
        // Button
        view.addSubview(createButton)
        createButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingBottom: 32, paddingRight: 32, height: 50)
    }
    
}

extension CreateRecipeController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
