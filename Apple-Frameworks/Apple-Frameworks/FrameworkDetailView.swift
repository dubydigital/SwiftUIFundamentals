//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/9/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework

    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
    
            FrameworkTitleView(frameWork: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
//            .foregroundColor(.yellow)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .tint(.red)
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            
//              Link("View Our Term of Service", destination: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
           
        })
 
        
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
