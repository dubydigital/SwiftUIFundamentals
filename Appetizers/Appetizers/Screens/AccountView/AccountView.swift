//
//  AccountView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $accountViewModel.firstName)
                    TextField("Last Name", text: $accountViewModel.lastName)
                    TextField("Email", text: $accountViewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $accountViewModel.birthdate, displayedComponents: .date)
                    
                    Button {
                        print("Save")
                        save()
                    } label : {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.extraNapkins)
                    Toggle("Frequent Refils", isOn: $accountViewModel.frequentRefils)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                                
            }
            .navigationTitle(Text("😀 Account"))
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .cancel())
        }
    }
    
    func save() {
        if accountViewModel.isValidForm {
            print("Save Pressed")
        }
    }
    
}

#Preview {
    AccountView()
}
