//
//  MainView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel: MainViewViewModel
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView(viewModel: LoginViewViewModel())
        }
    }

    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewViewModel())
}
