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
        NavigationView{
            ScrollView {
                Text("separator")
                LazyVGrid(columns: viewModel.columns ){
                    ForEach(MockData.frameworks, id: \.id ) { framework in
                        FrameworkTitleView(frameWork: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("Apple Frameworks")
            .fullScreenCover(isPresented: $viewModel.isShowingDetailView, content: {
//                MusicListView(isShowingDetailView: $viewModel.isShowingDetailView)
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
    }
}

#Preview {
    FrameworkGridView()
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    
}


