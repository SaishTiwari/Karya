//
//  HomePage.swift
//  ToDoList
//
//  Created by Saish Tiwari on 27/07/2024.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject  var listviewmodel : ListViewModel

    var body: some View {
        ZStack{
            
            
            
            TabView{
                
                NavigationView{
                    ListView()
                }
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("ToDoList")
                    }
                
                QuotesPage()
                    .tabItem {
                        Image(systemName: "quote.opening")
                        Text("Quotes")
                    }
                
                
                
                
            }
        }
    }
}

#Preview {
    NavigationView{
        
        
        HomePage()
            .environmentObject(ListViewModel())
    }
        
}
