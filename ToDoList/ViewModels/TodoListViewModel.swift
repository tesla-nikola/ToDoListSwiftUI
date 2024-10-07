//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation
import FirebaseFirestore


final class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func deleteItem(with id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
