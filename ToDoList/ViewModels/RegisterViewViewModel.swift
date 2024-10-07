//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class RegisterViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""

    init() {

    }

    func register() {
        guard validate() else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [unowned self] result, error in
            if error != nil {
                errorMessage = error!.localizedDescription
                return
            }
            guard let userID = result?.user.uid else { return }
            saveUser(id: userID)
        }
    }

    private func saveUser(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
    }

    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter your name"
            return false
        }
        guard email.contains("@"), email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Please enter a valid password"
            return false
        }
        return true
    }
}
