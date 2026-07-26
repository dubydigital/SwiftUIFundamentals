//
//  OrderView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI
import Foundation

struct OrderView: View {
    // Used for mock
    @State private var orderItems = MockData.orderItems
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                        /* // Alternative way to delete
                         .onDelete(perform: { indexSet in
                         orderItems.remove(atOffsets: indexSet) })
                         */
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("Order Placed")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 35)
                }
                
                // Empty Button
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.  Please add an appetizer! ")
                }
            }.navigationTitle(Text("🧾 Orders"))
        }
        
    }
    
    // Delete function
    func deleteItems(at offesets: IndexSet) {
        order.deleteItems(at: offesets)
//        order.items.remove(atOffsets: offesets)
    }
}

#Preview {
    OrderView()
}
