//
//  LoginView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel: LoginViewViewModel

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           backgroundColor: Color.pink)

                // Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In", backgroundColor: .blue) {
                        // Attempt Login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)

                // Create Account
                VStack {
                    Text("New Around Here?")
                    NavigationLink("Create An Account", destination: RegisterView(registerViewViewModel: RegisterViewViewModel()))
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewViewModel())
}
