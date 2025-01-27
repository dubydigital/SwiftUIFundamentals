//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/9/25.
//

import SwiftUI
import Foundation

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks ) { framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(frameWork: framework)
                        }
                    }
                }
                .navigationTitle("Apple Frameworks")
                .navigationDestination(for: Framework.self) { framework in
                    FrameworkDetailView(framework: framework)
                }
            }
        } 
        .accentColor(Color(.label)) // add for darkmode text color auto change
    }
}

#Preview {
    FrameworkGridView()
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}


