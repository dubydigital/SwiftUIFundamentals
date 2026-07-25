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
                    TextField("First Name", text: $accountViewModel.user.firstName)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                    TextField("Email", text: $accountViewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $accountViewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        print("Save")
                        accountViewModel.saveChanges()
                    } label : {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Frequent Refils", isOn: $accountViewModel.user.frequentRefils)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                                
            }
            .onAppear {
                accountViewModel.retrieveUser()
            }
            .navigationTitle(Text("😀 Account"))
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .cancel())
        }
    }
    

}

#Preview {
    AccountView()
}
