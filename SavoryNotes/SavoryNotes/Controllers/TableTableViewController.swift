//
//  TableTableViewController.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit

class TableTableViewController: UITableViewController {

    let prettyPlease = UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0)
    let youngSalmon = UIColor(red: 255/255, green: 184/255, blue: 184/255, alpha: 1.0)
    let electricBlue = UIColor(red: 126/255, green: 255/255, blue: 245/255, alpha: 1.0)
    let hammamBlue = UIColor(red: 103/255, green: 230/255, blue: 220/255, alpha: 1.0)
    
    var recipeItems = [RecipeItem]() {
        didSet {
            print("recipe items was set")
            tableView.reloadData()
        }
    }
    
    let reuseIdentifier = "RecipeCell"
    
    lazy var createNewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = hammamBlue
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        
        button.addTarget(self,  action: #selector(createNewRecipe), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        PostService.shared.fetchAllItems { (allItems) in
            self.recipeItems = allItems
        }
        
        navigationItem.title = "Savory Notes"
    }
    
    @objc func createNewRecipe() {
        let vc = CreateRecipeController()
        present(vc, animated: true, completion: nil)
    }

    // MARK - Helper function
    func configureTableView() {
        tableView.backgroundColor = prettyPlease    
        
        tableView.register(RecipeCell.self,  forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 100
        tableView.separatorColor = .red
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
        return recipeItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? RecipeCell else { return UITableViewCell() }
        
        cell.recipeItem = recipeItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

