//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/21/26.
//

import Foundation
import SwiftUI
internal import Combine

// add "@MainActor" when using the async await api call getAppetrizersTask
@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
            
    
    // Using new Async Await Call
    func getAppetrizersTask(){
        self.isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizersTask()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    // Generic response
                    alertItem = AlertContext.invalidResponse
                }                
                isLoading = false
            }
        }
    }
    
    //MARK: - OG Code No longer used:
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { // Update UI On main Thread
                self.isLoading = false                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }

        }
    }
    
}
