//
//  ListView.swift
//  ToDoList
//
//  Created by Saish Tiwari on 10/07/2024.
//

import SwiftUI

struct ListView: View {
    @State var TodoList : [String] = ["Grocery Shopping", "Futsal Game", "Go To Gym", "Drop off litter"]
    var body: some View {
        
            List{
                
                
                ForEach(TodoList, id:\.self ){data in
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text(data)
                    }
                    
                    
                    
                    
                    
                    
                }
            }
            .listStyle(PlainListStyle())
            
            
            
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: AddNew()))
            
        
            
            .navigationTitle("TO DO LIST 📝")
        

        
       
    }
}

#Preview {
    NavigationView{
        ListView()
    }
}
