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
            IntroductionView()
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
