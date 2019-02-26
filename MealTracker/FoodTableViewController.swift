//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Chinonso Obidike on 2/26/19.
//  Copyright © 2019 Chinonso Obidike. All rights reserved.
//

import UIKit
import SafariServices

class FoodTableViewController: UITableViewController {

    var meals: [Meal] {
        return [
            Meal(name: "breakfast", food: [Food(name: "Milk", description: "from cow"),
            Food(name: "Cereal", description: "crunchy granola"),
            Food(name: "Yoghurt", description: "very sour")
                                           ]),
            Meal(name: "lunch", food: [Food(name: "Tuna", description: "sandwich"),
                                           Food(name: "Orange Juice", description: "orange"),
            ]),
            Meal(name: "supper", food: [Food(name: "Steak", description: "meat")
        ])
            
        ]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        let meal: Meal = meals[indexPath.section]
        let food: Food = meal.food[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal: Meal = meals[indexPath.section]
        let food: Food = meal.food[indexPath.row]
        
        var urlComponents: URLComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "en.wikipedia.org"
        urlComponents.path = "/wiki/\(food.name)"
        
        guard let url: URL = urlComponents.url else {
            fatalError()
        }
        
        let safariViewController: SFSafariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
    

}
