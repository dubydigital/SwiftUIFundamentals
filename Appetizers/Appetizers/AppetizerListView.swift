//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers: [Appetizer] = []
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
                List(appetizers, id: \.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle(Text("🍟 Appetizers"))
            }
        }
        .onAppear() {
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { // Update UI On main Thread
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }

        }
    }
}

#Preview {
    AppetizerListView()
}
