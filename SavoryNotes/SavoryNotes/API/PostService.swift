//
//  PostService.swift
//  SavoryNotes
//
//  Created by Student on 13.05.2023.
//


import UIKit
import Firebase

// Firebase Realtime Databse

struct RecipeItem {
    var title: String
    var type: String
    var id: String
    var description: String
    var ingredients: String
    var time: String
    
    init(keyID: String, dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.ingredients = dictionary["ingredients"] as? String ?? ""
        self.time = dictionary["time"] as? String ?? ""
    }
}

struct PostService {
    static let shared = PostService()
    let DB_REF = Database.database().reference()
    
    func fetchAllItems(completion: @escaping([RecipeItem]) -> Void) {
        var allItems = [RecipeItem]()
        DB_REF.child("items").observe(.childAdded) { (snapshot) in
            fetchSingleItem(id: snapshot.key) { (item) in
                allItems.append(item)
                completion(allItems)
            }
        }
    }
    
    func fetchSingleItem(id: String, completion: @escaping(RecipeItem) -> Void) {
            DB_REF.child("items").child(id).observeSingleEvent(of: .value) {(snapshot) in
                guard let dictionary  = snapshot.value as? [String: Any]
                else { return }
                
            let recipeItem = RecipeItem(keyID: id, dictionary: dictionary)
            completion(recipeItem)
        }
    }
    
    func uploadRecipeItem(text: String, text2: String, text3: String, text4: String, text5: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        
        let values = ["title": text, "type": text2, "description": text3, "ingredients": text4, "time": text5] as [String: Any]
        let id = DB_REF.child("items").childByAutoId()
        
        id.updateChildValues(values, withCompletionBlock: completion)
        id.updateChildValues(values) { (err, ref) in
            let value = ["id": id.key!]
            DB_REF.child("items").child(id.key!).updateChildValues(value, withCompletionBlock: completion)
        }
    }
}
