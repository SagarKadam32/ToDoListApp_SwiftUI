//
//  ListView.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 07/03/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["This is the first item",
                                  "This is the 2nd item",
                                  "This is the 3rd item"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Do List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView(textFieldText: "Item-1")))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

