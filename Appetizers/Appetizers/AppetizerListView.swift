//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
//    @State private var appetizers: [Appetizer] = []
    private var useMock: Bool = false
        
    var body: some View {
        NavigationView {
            if useMock {
                // Using Mock Data:
                List(MockData.appetizers, id: \.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle(Text("🍟 Appetizers"))
            } else {
                List(viewModel.appetizers, id: \.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle(Text("🍟 Appetizers"))
            }
        }
        .onAppear() {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
