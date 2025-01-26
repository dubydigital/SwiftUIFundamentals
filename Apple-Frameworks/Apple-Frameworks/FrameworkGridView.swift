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
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns ){
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
                MusicListView(isShowingDetailView: $viewModel.isShowingDetailView)
//                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
//                                    isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
    }
}

#Preview {
    FrameworkGridView()
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    
}

struct FrameworkTitleView: View {
    let frameWork: Framework
    
    var body: some View {
        VStack {
            Image(frameWork.imageName)
                .resizable()
                .frame(width: 90, height: 90, alignment: .center)
            Text(frameWork.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
