//
//  ContentView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @AppStorage("isLogin") var isLogin  = false
    
    
    // MARK: - BODY
    
    var body: some View {
        if isLogin {
            DashboardView()
        } else {
            AuthView()
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
