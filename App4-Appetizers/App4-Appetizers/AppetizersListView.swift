//
//  AppetizersListView.swift
//  App4-Appetizers
//
//  Created by Mark Dubouzet on 3/12/25.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizersListView()
}
