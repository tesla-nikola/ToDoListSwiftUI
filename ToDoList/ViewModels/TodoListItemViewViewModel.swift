//
//  TodoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class TodoListItemViewViewModel: ObservableObject {
    init() {
        
    }

    func toggleDone(item: TodoListItem) {
        var newItem = item
        newItem.isDone.toggle()

        guard let uid = Auth.auth().currentUser?.uid else { return }

        Firestore.firestore().collection("users/\(uid)/todos").document(item.id).updateData(["isDone": newItem.isDone])
    }
}
