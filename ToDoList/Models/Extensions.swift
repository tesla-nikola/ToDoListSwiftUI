//
//  Extensions.swift
//  ToDoList
//
//  Created by Soham Ray on 06.10.24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] ?? [:]
        } catch {
            return [:]
        }
    }
}
