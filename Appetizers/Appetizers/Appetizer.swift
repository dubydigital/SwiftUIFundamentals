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
                                           description: "Test Decscription",
                                           price: 10.00,
                                           imageURL: "",
                                           calories: 2000,
                                           protein: 99,
                                           carbs: 99)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}





