//
//  ListView.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 07/03/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ListRowView(title: "This is the first item!")
        }
        .navigationTitle("To Do List 📝")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

