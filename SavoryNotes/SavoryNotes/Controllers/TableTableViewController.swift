//
//  TableTableViewController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit

class TableTableViewController: UITableViewController {

    let reuseIdentifier = "RecipeCell"
    
    lazy var createNewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.backgroundColor = .green
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        button.addTarget(self,  action: #selector(createNewRecipe), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    @objc func createNewRecipe() {
        let vc = CreateRecipeController()
        present(vc, animated: true, completion: nil)
    }

    // MARK - Helper function
    func configureTableView() {
        tableView.backgroundColor = .lightGray
        
        tableView.register(RecipeCell.self,  forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 100
        tableView.separatorColor = .systemRed
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        tableView.tableFooterView = UIView()
        
        tableView.addSubview(createNewButton)
        createNewButton.anchor(bottom: tableView.safeAreaLayoutGuide.bottomAnchor, right: tableView.safeAreaLayoutGuide.rightAnchor,
            paddingBottom: 16, paddingRight: 16, width: 56, height: 56)
        createNewButton.layer.cornerRadius = 56 / 2
        createNewButton.alpha = 1
    }
}


extension TableTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? RecipeCell else { return UITableViewCell() }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

