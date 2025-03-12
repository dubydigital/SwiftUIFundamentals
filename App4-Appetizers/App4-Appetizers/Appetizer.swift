//
//  Appetizer.swift
//    
//
//  Created by Mark Dubouzet on 3/12/25.
//

import Foundation


/*
 "  imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
    "description": "This perfectly thin cut just melts in your mouth.",
    "calories": 300,
    "protein": 14,
    "name": "Asian Flank Steak",
    "price": 8.99,
    "carbs": 0,
    "id": 1
*/

struct Appetizer: Decodable, Identifiable  {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

/*
 {
    request: [Appetizer]
 }
 */
struct AppetizerResponse {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001, name: "Test Appetizer",
                                           description: "Test Description",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers = [sampleAppetizer,
                             sampleAppetizer,
                             sampleAppetizer,
                             sampleAppetizer,
                             sampleAppetizer]
}
