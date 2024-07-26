//
//  ListView.swift
//  ToDoList
//
//  Created by Saish Tiwari on 10/07/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject  var listviewmodel : ListViewModel
    var body: some View {
        
        ZStack{
            
            if listviewmodel.TodoList.isEmpty{
                NoItemsView()
            }
            else{
                List{
                    
                    
                    
                    ForEach(listviewmodel.TodoList){data in
                            
                        HStack {
                            
                            
                            
                            Image(systemName: data.isCompleted ? "checkmark.circle" : "circle")
                            
                                .foregroundColor(data.isCompleted ? Color.green : Color.red)
                            Text(data.title)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listviewmodel.updateStatus(items: data)
                                    }
                                }
                            
                        }
                        
                        .font(.title2)
                        .padding(.vertical, 8)
                        
                        
                        
                        
                        
                        
                        
                    }
                    .onDelete(perform: listviewmodel.DeleteItems)
                    .onMove(perform: listviewmodel.MoveItems)
                        
                    

                    
                }
                
                
                .listStyle(PlainListStyle())
                
            }
        }
        
      
            
            
            
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
    .environmentObject(ListViewModel())
}
