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
            typeLabel.text = recipeItem?.type
        }
    }
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
//        label.textColor = .white
        label.text = "Recipe title"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
//        label.textColor = .white
        label.text = "Type: dessert"
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .darkGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
        
        addSubview(typeLabel)
        typeLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
