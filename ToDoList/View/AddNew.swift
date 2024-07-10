//
//  AddNew.swift
//  ToDoList
//
//  Created by Saish Tiwari on 10/07/2024.
//

import SwiftUI

struct AddNew: View {
    @State var NewText : String = ""
    var body: some View {
        
        ScrollView {
            VStack{
                TextField("Type Something Here...", text: $NewText)
                    .frame(width:.infinity, height: 55)
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                    .foregroundColor(.black)
                
                    .padding()
                
                Button(action: {
                    
                }, 
                       label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: .infinity)
                        .padding(20)
                        .background(Color.blue.cornerRadius(10))
                        
                        
                })
            }
            .navigationTitle("Add an Item ✍️")
        }
    }
}

#Preview {
    NavigationView{
        AddNew()
    }
}
