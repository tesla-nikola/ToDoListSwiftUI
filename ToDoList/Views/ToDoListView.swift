//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List (items) { item in
                    TodoListItemView(item: item)
                        .swipeActions(allowsFullSwipe: true) {
                            Button {
                                // Delete item
                                viewModel.deleteItem(with: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(viewModel: NewItemViewViewModel(), newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "T0Z7lPEWt5T56Ps6IBoFJPFspZn1")
}
