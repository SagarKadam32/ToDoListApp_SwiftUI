//
//  ListViewModel.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 09/03/23.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items:[ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        /*
        let newItems = [
            ItemModel(title: "First Task", isCompleted: false),
            ItemModel(title: "This is Second Task", isCompleted: true),
            ItemModel(title: "Third!", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
         */
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
//       if let index = items.firstIndex { (existingItem) -> Bool in
//            return item.id == existingItem.id
//       } {
//
//       }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
            
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
