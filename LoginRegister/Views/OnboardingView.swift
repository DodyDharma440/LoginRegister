//
//  OnboardingView.swift
//  LoginRegister
//
//  Created by Dodi Aditya on 16/05/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @Binding var mode: String
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            ZStack {
                Color.purple
                    .opacity(isAnimating ? 0.7 : 0)
                    .animation(.easeOut(duration: 1.5), value: isAnimating)
                
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -16)
                    .animation(.easeOut(duration: 1.5).delay(0.7), value: isAnimating)
                
            } // ZStack
            .clipShape(RoundedRectangle(cornerRadius: 36))
            .frame(maxHeight: 400)
            .padding(.horizontal)
            
            
            Spacer()
            
            Text("""
    Discover your
    Dream Job Here
    """)
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1.5), value: isAnimating)
            
            Text("Explore all the most existing jobs roles based on your interest and study major")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.vertical, 8)
                .foregroundColor(.gray)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1.5), value: isAnimating)
            
            Spacer()
            
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.2)) {
                        mode = "register"
                    }
                }, label: {
                    Text("Register")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                })
                
                Button(action: {
                    withAnimation(.easeOut(duration: 0.2)) {
                        mode = "login"
                    }
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                })
            } // HStack
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white, lineWidth: 2)
            )
            .padding(.bottom, 20)
            .padding(.horizontal, 36)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 20)
            .animation(.easeOut(duration: 1.5), value: isAnimating)
        } // VStack
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(mode: .constant(""))
    }
}
