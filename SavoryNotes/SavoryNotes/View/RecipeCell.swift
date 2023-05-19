//
//  RecipeCell.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    var recipeItem: RecipeItem? {
        didSet {
            titleLabel.text = recipeItem?.title
            typeLabel.text = recipeItem?.type ?? ""
            timeLabel.text =  recipeItem?.time ?? ""
            descriptionLabel.text =  recipeItem?.description ?? ""
            ingredientsLabel.text =  recipeItem?.ingredients ?? ""
        }
    }
    
    private let spaceCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Category: " // Empty initial text
        return label
    }()
    
    private let spaceTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Preparation time: " // Empty initial text
        return label
    }()
    
    private let spaceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Method of preparation: "// Empty initial text
        return label
    }()
    
    private let spaceIngredientsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Ingredients: " // Empty initial text
        return label
    }()
    
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
            label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
            label.numberOfLines = 50 // Display multiple lines
            label.lineBreakMode = .byWordWrapping // Wrap at word boundaries
            label.text = "" // Empty initial text
            return label
    }()

    private let ingredientsLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18)
        label.text = "" // Empty initial text
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // backgroundColor = .darkGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(spaceCategoryLabel)
        spaceCategoryLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)

        addSubview(typeLabel)
        typeLabel.anchor(top: spaceCategoryLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(spaceTimeLabel)
        spaceTimeLabel.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(timeLabel)
        timeLabel.anchor(top: spaceTimeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)

        addSubview(spaceDescriptionLabel)
        spaceDescriptionLabel.anchor(top: timeLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: spaceDescriptionLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    
        addSubview(spaceIngredientsLabel)
        spaceIngredientsLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(ingredientsLabel)
        ingredientsLabel.anchor(top: spaceIngredientsLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
