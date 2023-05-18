//
//  LoginView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 16/05/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    // MARK: - PROPERTY

    @Binding var mode: String
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            VStack(spacing: 14) {
                Text("Hello Again!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Wellcome back you've been missed!")
                    .font(.title2)
                    .padding(.horizontal, 40)
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
                    .disabled(authViewModel.isLoading)
                
                HStack {
                    Group {
                        if showPassword {
                            TextField("Enter Password", text: $password)
                        } else {
                            SecureField("Enter Password", text: $password)
                        }
                    } // Group
                    .disabled(authViewModel.isLoading)
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
                
                Button(action: {
                    authViewModel.login(email: email, password: password)
                }, label: {
                    Group {
                        if authViewModel.isLoading {
                            ProgressView()
                        } else {
                            Text("Sign In")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                    }
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
                    .opacity(authViewModel.isLoading ? 0.5 : 1)
                })
                .disabled(authViewModel.isLoading)
                
                HStack(spacing: 0) {
                    Text("Not a member? ")
                        .fontWeight(.semibold)
                    Text("Register Now")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            if !authViewModel.isLoading {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    mode = "register"
                                }
                            }
                        }
                } // HStack
                .font(.footnote)
                .padding(.vertical, 20)
                .opacity(authViewModel.isLoading ? 0.5 : 1)
            } // VStack
            
            Spacer()
            Spacer()
        } // VStack
        .padding(.horizontal, 30)
        .alert(isPresented: $authViewModel.showingAlert) {
            Alert(title: Text("Whoops"), message: Text(authViewModel.errorMessage), dismissButton: .default(Text("Okay, Got It"), action: {
                authViewModel.errorMessage = ""
            }))
        }
    }
}

// MARK: - PREVIEW

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(mode: .constant("login"))
    }
}
