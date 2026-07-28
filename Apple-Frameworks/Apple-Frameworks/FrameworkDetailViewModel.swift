//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 7/27/26.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    var framework: Framework
    var isShowingDetailView: Binding<Bool>  // <-- 1. Binding
    @Published var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) { // <-- 2. Initializer
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView // <-- 3. Binding
    }
}
