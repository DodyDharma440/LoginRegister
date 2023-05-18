//
//  AuthView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 18/05/23.
//

import SwiftUI

struct AuthView: View {
    // MARK: - PROPERTY
    
    @State private var mode: String = ""
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.pink.opacity(0.2))
                .frame(width: 400, height: 500)
                .offset(x: 60, y: -200)
            
            Circle()
                .foregroundColor(.blue.opacity(0.2))
                .frame(width: 300, height: 500)
                .offset(x: 50, y: 150)
            
            Circle()
                .foregroundColor(.purple.opacity(0.2))
                .frame(width: 400, height: 500)
                .offset(x: -50, y: 180)
            
            VStack {
                if mode == "login" {
                    LoginView(mode: $mode)
                } else if mode == "register" {
                    RegisterView(mode: $mode)
                } else {
                    OnboardingView(mode: $mode)
                }
                
                if mode == "login" || mode == "register" {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.5)) {
                            mode = ""
                        }
                    }, label: {
                        Group {
                            Circle()
                                .foregroundColor(.purple.opacity(0.7))
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                }
                                .shadow(color: .purple.opacity(0.5), radius: 20, y: 10)
                                .onAppear {
                                    isAnimating = true
                                }
                                .onDisappear {
                                    isAnimating = false
                                }
                        }
                        .offset(y: isAnimating ? -14 : 0)
                        .animation(.linear(duration: 3).repeatForever(), value: isAnimating)
                    })
                }
            } // VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
        } // ZStack
    }
}

// MARK: - PREVIEW

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
