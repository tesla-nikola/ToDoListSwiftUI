//
//  NewItemView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel: NewItemViewViewModel
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate, in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please enter a title and a due date."))
            }
        }
    }
}

#Preview {
    NewItemView(viewModel: NewItemViewViewModel(), newItemPresented: Binding(get: { return true },
        set: {_ in }))
}
