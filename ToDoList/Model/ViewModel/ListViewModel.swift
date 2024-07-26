//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Saish Tiwari on 10/07/2024.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var TodoList : [ItemModel] = []{
        didSet{
            saveItems()
        }
    
    }
    let itemskey : String = "item_list"
    
    init() {
        getItems()
    }
    
 

func getItems(){
     
    guard 
        let data = UserDefaults.standard.data(forKey: itemskey),
        let saveditems = try? JSONDecoder().decode([ItemModel].self, from: data)
    else {return}
    
    
    
}
    
    func DeleteItems (indexSet:IndexSet){
        TodoList.remove(atOffsets: indexSet)

    }
    
    func MoveItems (from : IndexSet , to : Int){
        TodoList.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItems(title : String){
        
        let newItem = ItemModel (title: title, isCompleted: false)
        TodoList.append(newItem)
    }
    
    
    func updateStatus(items : ItemModel){
        
      if  let index = TodoList.firstIndex(where: {$0.id == items.id}){
          
          TodoList[index] = items.updateCompletion()
            
        }
    }
    
    func saveItems(){
        if let encodeddata = try? JSONEncoder().encode(TodoList){
            UserDefaults.standard.setValue(encodeddata, forKey: itemskey)
        }
        
        
    }

       
        
        
    

}
