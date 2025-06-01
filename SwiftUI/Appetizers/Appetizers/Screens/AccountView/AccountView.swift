//
//  AccountView.swift
//  Appetizers
//
//  Created by Sakir Saiyed on 30/05/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(.none)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthday,
                               displayedComponents: .date)
                    Button{
                        print("Save")
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                    
                    Section(header: Text("Request")) {
                        Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    
                    
                }
            }.navigationTitle("🧑‍💼 Account")
        }
        .onAppear() {
            viewModel.retrieveUserData()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
