//
//  AccountView.swift
//  Appetizers
//
//  Created by Mark Dubouzet on 7/8/26.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName
        case lastName
        case email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit({
                            focusedTextField = .lastName
                        })
                        .submitLabel(.next) //<-- Next
                    
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next) //<-- Next
                    
                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue) //<-- Continue
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
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Dismiss"){focusedTextField = nil }
//                }
//            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        focusedTextField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    .accessibilityLabel("Dismiss Keyboard")
                }
            }
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .cancel(Text("Done")) )
        }
    }
    

}

#Preview {
    AccountView()
}
