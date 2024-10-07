//
//  ProfileView.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 70, height: 70)

                    VStack(alignment: .leading,spacing: 16) {
                        HStack {
                            Text("Name: ")
                            Text(user.name)
                        }
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }
                        HStack {
                            Text("Member Since: ")
                            Text(user.joined.formatted())
                        }
                    }

                    TLButton(title: "Log Out", backgroundColor: .red) {
                        viewModel.logout()
                    }.frame(width: 100, height: 40)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
