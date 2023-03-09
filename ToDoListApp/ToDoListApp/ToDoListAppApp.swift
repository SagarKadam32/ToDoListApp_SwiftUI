//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 07/03/23.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
     
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
