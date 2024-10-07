//
//  RegisterView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewViewModel: RegisterViewViewModel

    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start Organizing todos",
                       angle: -15,
                       backgroundColor: .orange)

            Form {
                TextField("Full Name", text: $registerViewViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Email Address", text: $registerViewViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $registerViewViewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account",
                         backgroundColor: .green) {
                    // Attempt registration
                    registerViewViewModel.register()
                }
                         . padding()
            }
            .offset(y: -50)

            Spacer()
        }
    }
}

#Preview {
    RegisterView(registerViewViewModel: RegisterViewViewModel())
}
