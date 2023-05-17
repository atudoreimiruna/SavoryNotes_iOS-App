//
//  RecipeCell.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

self.description = dictionary["description"] as? String ?? ""
        self.ingredients

import UIKit

class RecipeCell: UITableViewCell {
    
    var recipeItem: RecipeItem? {
        didSet {
            titleLabel.text = recipeItem?.title
            typeLabel.text = "Category: " + (recipeItem?.type ?? "")
            timeLabel.text = "Preparation time: " + (recipeItem?.time ?? "")
            descriptionLabel.text = "Method of preparation: " (recipeItem?.description ?? "")
            ingredientsLabel.text = "Ingredients: " (recipeItem?.ingredients ?? "")
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "" // Empty initial text
        return label
    }()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "" // Empty initial text
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "" // Empty initial text
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "" // Empty initial text
        return label
    }()

    private let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "" // Empty initial text
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // backgroundColor = .darkGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(typeLabel)
        typeLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)

        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: timeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    
        addSubview(ingredientsLabel)
        ingredientsLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
