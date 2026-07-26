//
//  Order.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/26/26.
//

import Foundation
import SwiftUI
internal import Combine


final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ item: Appetizer) {
        items.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
