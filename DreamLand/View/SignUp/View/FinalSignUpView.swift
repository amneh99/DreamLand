//
//  FinalSignUpView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct FinalSignUpView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(.mainLogo)
            
            Text("Are You Ready For The Most Amazing Adventures!")
                .styledText(weight: .medium(16))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            DlMainButton(title: "Go!") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.5)) {
                   
                }
            }
            .frame(width: 220)
            .padding(.bottom)
        }
    }
    func IntroductionView() -> some View {
        HStack(spacing: 40) {
            Image(.yellowStar)
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
