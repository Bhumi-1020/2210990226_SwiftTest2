//
//  MealInfoTableViewController.swift
//  RecipeManager
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class MealInfoTableViewController: UITableViewController {
    
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var prepTimeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var catagoryLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var calorieCountLabel: UILabel!
    
    var mealInfo: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCells()
    }
    
    func updateCells() {
        if let meal = mealInfo {
            nameLabel.text = meal.name
            thumbnailImage.image = meal.thumbnail
            prepTimeLabel.text = "\(meal.prepTime)"
            ingredientsLabel.text = meal.ingredients.keys.joined(separator: ", ")
            catagoryLabel.text = meal.catagory
            instructionsLabel.text = meal.instructions
            calorieCountLabel.text = "\(meal.calorieCount) kcal"
            
            title = meal.name
        }
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
        
        guard let meal = mealInfo else { return }
        
        let shareMessage = """
        Recipe: \(meal.name)
        Prep Time: \(meal.prepTime)
        Category: \(meal.catagory)
        Calories: \(meal.calorieCount) kcal
        Ingredients: \(meal.ingredients.keys.joined(separator: ", "))
        Instructions: \(meal.instructions)
        """
            
            var activityItems: [Any] = [shareMessage]
            if let image = meal.thumbnail {
                activityItems.append(image)
            }
        
        let activityViewController = UIActivityViewController(activityItems: [mealInfo as Any], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
//    func updateCell(indexPath: IndexPath) {
//        let meal = mealInfo[indexPath.row]
//        nameLabel.text = meal.name
//        thumbnailImage.image = meal.thumbnail
//        calorieCountLabel.text = "\(meal.calorieCount) kcal"
//        prepTimeLabel.text = "\(meal.prepTime) min"
//        thumbnailImage.image = meal.thumbnail
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
//        let meal = mealInfo[indexPath.row]
//        nameLabel.text = meal.name
//        thumbnailImage.image = meal.thumbnail
//        calorieCountLabel.text = "\(meal.calorieCount) kcal"
//        prepTimeLabel.text = "\(meal.prepTime) min"
//        thumbnailImage.image = meal.thumbnail
//        return cell
//    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
