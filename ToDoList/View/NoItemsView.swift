//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Saish Tiwari on 25/07/2024.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        
        VStack(spacing : -10){
            Spacer()
            
            Text("Your List is Empty")
                .font(.title)
                .foregroundColor(.red)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            Text("""
            Looks like you have a clean slate! Why not add something fun or important to do? Tap the Add button in the top right corner and get started. How about:
                •    Try a new recipe
                •    Read a chapter of a book
                •    Call an old friend
                •    Dance like no one’s watching
                •    Plan a mini-adventure
            """)
            
            
            .padding()
            .multilineTextAlignment(.leading)
            
            NavigationLink(destination: AddNew(), label: {
                
                Text("Add Something")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 55)
                    .background(Color.blue).cornerRadius(10).padding()
                    .foregroundColor(.white)
                   
                
                            })
            
            
        Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        
        
        
        
        
    }
        
        .padding()
    
}
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
