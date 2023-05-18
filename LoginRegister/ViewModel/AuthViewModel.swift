//
//  AuthViewModel.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 18/05/23.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    let firebaseAuth = Auth.auth()
    
    @AppStorage("isLogin") var isLogin: Bool = false
 
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
   
    
    func login(email: String, password: String) {
        isLoading = true
        firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            self.isLoading = false
            
            if error != nil {
                self.showingAlert = true
                self.errorMessage = error?.localizedDescription ?? "Something went wrong"
            } else {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isLogin = true
                }
            }
        }
    }
    
    func register(email: String, password: String) {
        isLoading = true
        firebaseAuth.createUser(withEmail: email, password: password) { result, error in
            self.isLoading = false
            
            if error != nil {
                self.showingAlert = true
                self.errorMessage = error?.localizedDescription ?? "Something went wrong"
            } else {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isLogin = true
                }
            }
        }
    }
    
    func logout() {
        do {
            try firebaseAuth.signOut()
            isLogin = false
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
    
    func getCurrentUser() -> AuthModel? {
        let user = firebaseAuth.currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            let displayName = user.displayName
         
           
            return AuthModel(uid: uid, email: email ?? "", image: photoURL ?? URL(string: ""), displayName: displayName)
        }
        return nil
    }
}
