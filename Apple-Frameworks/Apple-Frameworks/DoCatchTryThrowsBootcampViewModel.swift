//
//  DoCatchTryThrowsBootcampViewModel.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/13/25.
//

import Foundation
import SwiftUI

class DoCatchTryThrowsBootcampDataManager {
    func getTitle() -> String {
        return "New Text"
    }
}

class DoCatchTryThrowsBootcampViewModel: ObservableObject {
    @Published var text: String = "String text."
    let manager = DoCatchTryThrowsBootcampDataManager()
 
    func fetchTitle() {
        let newTitle = manager.getTitle()
    }
}


struct DoCatchTryThrowsBootcamp: View {
    @StateObject private var viewModel = DoCatchTryThrowsBootcampViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.green)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}


#Preview {
    DoCatchTryThrowsBootcamp()
}
