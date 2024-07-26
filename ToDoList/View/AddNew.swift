//
//  AddNew.swift
//  ToDoList
//
//  Created by Saish Tiwari on 10/07/2024.
//

import SwiftUI

struct AddNew: View {
    
    @Environment (\.presentationMode) var presenatationmode
    @EnvironmentObject var listviewmodel : ListViewModel
    @State var NewText : String = ""
    @State var title : String = ""
    @State var showAlert : Bool = false
    var body: some View {
        
        ScrollView {
            VStack{
                TextField("Type Something Here...", text: $NewText)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
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
                        .onTapGesture (count: 1){
                            savedButtonPress()
                        }
                        
                        
                })
            }
            .navigationTitle("Add an Item ✍️")
        }
        
        .alert(isPresented: $showAlert , content:getAlert)
            
        
    }
    
    func savedButtonPress(){
        if(checkTextInput()){
            listviewmodel.addItems(title: NewText)
            presenatationmode.wrappedValue.dismiss()
            
            
            
        }
        
        else{
            title = "Your ToDoList item must have atleast 3 characters"
            showAlert.toggle()
            
            
            
        }
        
    }
    
    func checkTextInput() -> Bool
    {
        
        if (NewText.count > 3 ){
            return true
        }
        else{
            return false
        }
          
        
        
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(title), dismissButton: .cancel(Text("OK")))
    }
    
    
    
}

#Preview {
    NavigationView{
        AddNew()
                }
    .environmentObject(ListViewModel())

}
