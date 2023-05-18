//
//  LoginRegisterApp.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 16/05/23.
//

import SwiftUI
import Firebase

@main
struct LoginRegisterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
