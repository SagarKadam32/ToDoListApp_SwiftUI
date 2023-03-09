//
//  ItemModel.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 09/03/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
