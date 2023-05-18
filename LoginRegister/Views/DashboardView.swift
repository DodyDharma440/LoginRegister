//
//  DashboardView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 18/05/23.
//

import SwiftUI
import Firebase

struct DashboardView: View {
    // MARK: - PROPERTY
    
    let firebaseAuth = Auth.auth()
    
    @AppStorage("isLogin") var isLogin: Bool = true
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        let user = authViewModel.getCurrentUser()
        
        VStack {
            Text(user?.email ?? "")
            
            Button(action: {
                authViewModel.logout()
            }, label: {
                Text("Logout")
            }) // BUTTON
        } // VStack
    }
}

// MARK: - PREVIEW

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
