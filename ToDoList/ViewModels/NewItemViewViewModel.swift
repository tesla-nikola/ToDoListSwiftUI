//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

final class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert = false

    init() {}

    func save() {
        guard canSave else { return }

        guard let uid = Auth.auth().currentUser?.uid else { return }

        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)

        // Save the model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }

    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }

        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }

        return true
    }
}
