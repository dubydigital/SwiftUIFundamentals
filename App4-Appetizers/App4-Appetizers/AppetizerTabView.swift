 //
//  ContentView.swift
//  App4-Appetizers
//
//  Created by Mark Dubouzet on 3/12/25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            
            AppetizersAccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
            }
            
            AppetizersOrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
            }
        }// TabView
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
