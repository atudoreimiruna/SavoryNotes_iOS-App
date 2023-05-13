//
//  CreateRecipeController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit


class CreateRecipeController : UIViewController {
   
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
//        label.textColor = .whites
        label.text = "Create a new recipe"
        label.textAlignment = .center
        return label
    }()
    
    private let itemTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
//        tf.textColor = .black
//        tf.backgroundColor = .white
        tf.layer.cornerRadius = 10
        tf.placeholder="Title"
        return tf
    }()
    
    private let typeTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 24)
//        tf.textColor = .black
//        tf.backgroundColor = .white
        tf.placeholder = "Category"
        tf.layer.cornerRadius = 10
        
        return tf
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create item", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(createItemPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
         configureUI()
    }
    
    @objc func createItemPressed() {
        guard let recipeText = itemTextField.text else { return }
        guard let recipeType = typeTextField.text else { return }
        PostService.shared.uploadRecipeItem(text: recipeText, text2: recipeType) { (err, ref) in
            self.itemTextField.text = ""
            self.typeTextField.text = ""
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func configureUI() {
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(itemTextField)
        itemTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 128, paddingLeft: 16, paddingRight: 16, height: 40)
        itemTextField.delegate = self
        
        view.addSubview(typeTextField)
        typeTextField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 218, paddingLeft: 16, paddingRight: 16, height: 40)
        typeTextField.delegate = self
        
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
