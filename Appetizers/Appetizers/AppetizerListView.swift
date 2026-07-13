//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers, id: \.id) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle(Text("🍟 Appetizers"))
        }
 
    }
}

#Preview {
    AppetizerListView()
}
