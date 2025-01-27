//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/9/25.
//

import SwiftUI
import Foundation

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkListViewModel()

    
    var body: some View {
        NavigationView{
            VStack{ 
                // Button

                NavigationLink(destination: MusicListView(isShowingDetailView: .constant(false)) ) {
                    AFButton(title: "iTunes Search")
                }
                
 
                
                // List
                List{
                    ForEach(MockData.frameworks ) { framework in
                        NavigationLink(destination:
                                        FrameworkDetailView(framework: framework,
                                        isShowingDetailView:
                                        $viewModel.isShowingDetailView)) {
                            FrameworkTitleView(frameWork: framework)
                        }
                    }
                }
                .navigationTitle("Apple Frameworks")
            }
            
            
        }
        .accentColor(Color(.label)) // add for darkmode text color auto change
    }
}

#Preview {
    FrameworkListView()
       //.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}


