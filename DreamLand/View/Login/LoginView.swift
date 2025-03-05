//
//  LoginView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/15/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Text("Welcome to")
                    .foregroundStyle(.white)
                    .customFont(.black(30))
                
                Image(.mainLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                VStack(spacing: 32) {
                    DlTextField(text: $viewModel.email, placeholder: "Email")
                    
                    DlTextField(text: $viewModel.password, placeholder: "Password")
                }
                
                DlMainButton(title: "Login") {
                    
                }
                .frame(width: 180)
                
                VStack(spacing: 16) {
                    Text("Or")
                        .foregroundStyle(.white)
                        .customFont(.medium(16))
                    
                    signUpButton()
                        .navLink(title: "", destination: SignUpView())
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .withBackground()
        }
    }
    
    func signUpButton() -> some View {
        Text("Sign up")
            .foregroundStyle(.white)
            .customFont(.medium(16))
            .underline()
    }
}

#Preview {
    LoginView()
}

private class ViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
