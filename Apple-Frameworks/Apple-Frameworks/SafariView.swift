//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/26/25.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    // Context -> UIViewControllerRepresentableContext
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> 
    SFSafariViewController {
            SFSafariViewController(url: url)
    }
        
    // UIViewControllerType ->
    func updateUIViewController(_ uiViewController: SFSafariViewController, 
                                context: UIViewControllerRepresentableContext<SafariView>){
        
    }

      
}
