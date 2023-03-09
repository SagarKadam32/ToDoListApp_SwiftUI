//
//  AddView.swift
//  ToDoListApp
//
//  Created by Sagar Kadam on 07/03/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here..", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.yellow)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                       label: {
                            Text("Save".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        })
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new ToDo list item must be atleast 3 characters long!!! 😱😨😰"
            showAlert = true
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(textFieldText: "Test")
        }
        .environmentObject(ListViewModel())
    }
}
