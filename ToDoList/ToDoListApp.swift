//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Saish Tiwari on 09/07/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listviewmodel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplashScreen()
            }
            .environmentObject(listviewmodel)

        }
    }
}
