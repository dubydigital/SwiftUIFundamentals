//
//  ContentView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
             AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                    // Alternative Label
//                    Image(systemName: "house")
//                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
            
        }
        .accentColor(.bPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
