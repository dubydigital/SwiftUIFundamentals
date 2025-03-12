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
        print("New Title: \(newTitle)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.text = "New Title Fetched! \(self.getCurrentDateFormatted())"
            }
    }
    
    func getCurrentDateFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy \n hh:m:ss" // Desired format
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
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
                print("tapped")
            }
    }
}

#Preview {
    DoCatchTryThrowsBootcamp()
}
