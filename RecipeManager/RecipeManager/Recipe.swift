//
//  Recipe.swift
//  RecipeManager
//
//  Created by student-2 on 23/11/24.
//

import Foundation
import UIKit

var mealsBySection: [(sectionName: String, recipes: [Recipe])] = [
    (sectionName: "Breakfast", recipes: breakfast),
    (sectionName: "Lunch", recipes: lunch),
    (sectionName: "Snacks", recipes: snacks),
    (sectionName: "Dinner", recipes: dinner)
]

struct Recipe {
    var name: String
    var prepTime: String
    var ingredients: [String : String]
    var instructions: String
    var catagory: String
    var calorieCount: Int 
    var thumbnail: UIImage?
}


var breakfast: [Recipe] = [
    Recipe(
        name: "Poha",
        prepTime: "10 min",
        ingredients: [
            "Poha": "1 cup",
            "Onion": "1 medium, chopped",
            "Green Chili": "1, finely chopped",
            "Spices": "As per taste",
            "Coriander": "For garnish"
        ],
        instructions: """
        1. Rinse poha under water and let it soak for 5 minutes.
        2. Heat oil in a pan, sauté onions and green chilies.
        3. Add spices, poha, and mix well.
        4. Garnish with coriander and serve warm.
        """,
        catagory: "Vegetarian",
        calorieCount: 250,
        thumbnail: UIImage(named: "oatmeal") ?? UIImage()
    ),
    Recipe(
        name: "Oatmeal",
        prepTime: "5 min",
        ingredients: [
            "Oats": "1/2 cup",
            "Milk": "1 cup",
            "Honey": "1 tbsp",
            "Fruits": "1/4 cup (banana, berries)"
        ],
        instructions: """
        1. Cook oats in milk over medium heat.
        2. Add honey and mix well.
        3. Top with fresh fruits and serve warm.
        """,
        catagory: "Vegetarian",
        calorieCount: 200,
        thumbnail: UIImage(named: "oatmeal") ?? UIImage()
    )
]

var lunch: [Recipe] = [
    Recipe(
        name: "Grilled Chicken Salad",
        prepTime: "15 min",
        ingredients: [
            "Chicken Breast": "1 (grilled)",
            "Lettuce": "1 cup",
            "Tomato": "1, chopped",
            "Cucumber": "1/2, sliced",
            "Dressing": "2 tbsp (vinaigrette)"
        ],
        instructions: """
        1. Grill the chicken breast until fully cooked.
        2. Toss lettuce, tomato, and cucumber in a bowl.
        3. Slice the grilled chicken and add on top.
        4. Drizzle with dressing and serve.
        """,
        catagory: "Gluten-Free",
        calorieCount: 300,
        thumbnail: UIImage(named: "chicken_salad") ?? UIImage()
    )
]

var snacks: [Recipe] = [
    Recipe(
        name: "Fruit Smoothie",
        prepTime: "5 min",
        ingredients: [
            "Banana": "1",
            "Berries": "1/2 cup",
            "Yogurt": "1/2 cup",
            "Milk": "1/2 cup"
        ],
        instructions: """
        1. Add all ingredients to a blender.
        2. Blend until smooth.
        3. Pour into a glass and enjoy.
        """,
        catagory: "Vegetarian",
        calorieCount: 180,
        thumbnail: UIImage(named: "smoothie") ?? UIImage()
    )
]

// **Dinner Recipes**
var dinner: [Recipe] = [
    Recipe(
        name: "Vegetable Stir-Fry",
        prepTime: "20 min",
        ingredients: [
            "Mixed Vegetables": "2 cups (carrot, broccoli, bell pepper)",
            "Soy Sauce": "2 tbsp",
            "Garlic": "2 cloves, minced",
            "Ginger": "1 tsp, grated",
            "Olive Oil": "2 tbsp"
        ],
        instructions: """
        1. Heat olive oil in a wok or large pan.
        2. Add garlic and ginger, sauté for 1 minute.
        3. Add vegetables and stir-fry for 10-15 minutes.
        4. Add soy sauce and mix well before serving.
        """,
        catagory: "Vegan",
        calorieCount: 220,
        thumbnail: UIImage(named: "stir_fry") ?? UIImage()
    )
]

