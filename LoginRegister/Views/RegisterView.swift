//
//  RegisterView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 16/05/23.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    // MARK: - PROPERTY
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    @Binding var mode: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VStack(spacing: 14) {
                Text("Hello There!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Wellcome to our application!")
                    .font(.title2)
                    .padding(.horizontal, 30)
                    .multilineTextAlignment(.center)
            } // VStack
            .padding(.top, 40)
            
            Spacer()
            
            VStack(spacing: 20) {
                TextField("Enter Email", text: $email)
                    .padding(.horizontal, 18)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    )
                HStack {
                    Group {
                        if showPassword {
                            TextField("Enter Password", text: $password)
                        } else {
                            SecureField("Enter Password", text: $password)
                        }
                    } // Group
                    .frame(maxWidth: .infinity)
                    
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .onTapGesture {
                            showPassword.toggle()
                        }
                } // HStack
                .padding(.horizontal, 18)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
                HStack {
                    Group {
                        if showConfirmPassword {
                            TextField("Enter Confirm Password", text: $confirmPassword)
                        } else {
                            SecureField("Enter Confirm Password", text: $confirmPassword)
                        }
                    } // Group
                    .frame(maxWidth: .infinity)
                    
                    Image(systemName: showConfirmPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .onTapGesture {
                            showConfirmPassword.toggle()
                        }
                } // HStack
                .padding(.horizontal, 18)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
                
                Button(action: {
                    authViewModel.register(email: email, password: password)
                }, label: {
                    Text("Register")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.red.opacity(0.8))
                                .frame(maxWidth: .infinity)
                                .shadow(color: .red.opacity(0.3), radius: 20, y: 10)
                        )
                        .padding(.top, 10)
                })
                
                HStack(spacing: 0) {
                    Text("Have an account? ")
                        .fontWeight(.semibold)
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.2)) {
                                mode = "login"
                            }
                        }
                } // HStack
                .font(.footnote)
                .padding(.vertical, 20)
            } // VStack
            
            Spacer()
            Spacer()
        } // VStack
        .padding(.horizontal, 30)
    }
}

// MARK: - PREVIEW

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(mode: .constant("register"))
    }
}
