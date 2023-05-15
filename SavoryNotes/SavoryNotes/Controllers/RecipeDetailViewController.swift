//
//  RecipeDetailViewController.swift
//  SavoryNotes
//
//  Created by Student on 15.05.2023.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var recipeItem: RecipeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let recipeItem = recipeItem else { return }
        nameLabel.text = recipeItem.title
        ingredientsLabel.text = recipeItem.ingredients
        descriptionLabel.text = recipeItem.description
    }
}
