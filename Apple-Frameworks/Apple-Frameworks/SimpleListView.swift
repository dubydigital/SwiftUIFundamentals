//
//  SimpleListView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/27/25.
//

import SwiftUI

struct MyDetailView: View {
    var framework: Framework
    let myDetailedText:String
    
    var body: some View {
        Link("View Our Term of Service", destination: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
    }
}


struct SimpleListView: View {
    var framework: Framework
    let myArray:[String] = ["Chama 1", "Chama 2", "Chama 3"]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(myArray, id: \.self) { chamaVal in
                    NavigationLink(chamaVal) {
                        MyDetailView(framework: framework, myDetailedText: "details")
                    }
                    
                }
            }
            
        }.navigationTitle("Simple List View")
    }
}

#Preview {
    SimpleListView(framework: MockData.sampleFramework)
}


/*
List{
    ForEach(myArray, id: \.self) { chamaVal in
        NavigationLink( destination: MyDetailView(myDetailedText: chamaVal)){
            Text(chamaVal)
        }
    }
}
*/
