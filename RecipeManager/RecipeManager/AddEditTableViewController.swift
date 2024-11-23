//
//  AddEditTableViewController.swift
//  RecipeManager
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class AddEditTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var prepTimeTextField: UITextField!
    @IBOutlet var ingredientTextField: UITextField!
    @IBOutlet var categotyTextField: UITextField!
    @IBOutlet var instructionsTextView: UITextView!
    @IBOutlet var calorieCountTextField: UITextField!
    
    var recipeName: String = ""
    var prepTime: String = ""
    var ingredients: [String: String] = [:]
    var instructions: String = ""
    var category: String = ""
    var calorieCount: Int = 0
    var thumbnail: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCells()
    }
    
    func updateCells() {
        nameTextField.text = recipeName
        prepTimeTextField.text = prepTime
        ingredientTextField.text = ingredients.keys.joined(separator: ", ")
        categotyTextField.text = category
        instructionsTextView.text = instructions
        calorieCountTextField.text = calorieCount > 0 ? "\(calorieCount)" : ""
        imageView.image = thumbnail ?? UIImage(systemName: "photo")
    }
    
    @IBAction func imageViewButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("User has chosen camera")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("User has chosen photo library")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard !recipeName.isEmpty, !prepTime.isEmpty, !ingredients.isEmpty, !instructions.isEmpty, !category.isEmpty else {return}
    
        let newRecipe = Recipe(
            name: self.recipeName,
            prepTime: self.prepTime,
            ingredients: self.ingredients,
            instructions: self.instructions,
            catagory: self.category,
            calorieCount: self.calorieCount,
            thumbnail: self.thumbnail ?? UIImage(systemName: "photo")!
        )
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//           
//                return cell
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
