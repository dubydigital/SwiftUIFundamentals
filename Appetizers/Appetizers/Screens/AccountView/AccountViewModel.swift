//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/25/26.
//

import Foundation
import SwiftUI
internal import Combine

final class AccountViewModel: ObservableObject {
     
    @Published  var firstName = ""
    @Published  var lastName = ""
    @Published  var email = ""
    @Published  var birthdate = Date()
    @Published  var extraNapkins = false
    @Published  var frequentRefils = false
        
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
