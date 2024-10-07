//
//  User.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
