//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewViewModel())
        }
    }
}
