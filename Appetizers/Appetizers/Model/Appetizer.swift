//
//  Appetizer.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/10/26.
//

import Foundation

// CODABLE Can use to parse
// - Tpye alias
// - Decodable when you receive
// - Encodable to update to server
// - Codable does both decode and encode

nonisolated struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

nonisolated struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// Mock Data
struct MockData {
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Appetizer",
                                           description: "Test Decscription. Ze best appetizer zer is. Simply the best. Oui",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItem1 = Appetizer(id: 0001,
                                           name: "Test Appetizer 1",
                                           description: "Test Decscription. Ze best appetizer zer is. Simply the best. Oui",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    static let orderItem2 = Appetizer(id: 0002,
                                           name: "Test Appetizer 2",
                                           description: "Test Decscription. Ze best appetizer zer is. Simply the best. Oui",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    static let orderItem3 = Appetizer(id: 0003,
                                           name: "Test Appetizer 3",
                                           description: "Test Decscription. Ze best appetizer zer is. Simply the best. Oui",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItem4 = Appetizer(id: 0004,
                                           name: "Test Appetizer 4",
                                           description: "Test Decscription. Ze best appetizer zer is. Simply the best. Oui",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItems = [orderItem1, orderItem2, orderItem3, orderItem4]
}





