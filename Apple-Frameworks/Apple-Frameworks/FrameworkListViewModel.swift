//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/9/25.
//

import Foundation
import SwiftUI

final class FrameworkListViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
              
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
}
