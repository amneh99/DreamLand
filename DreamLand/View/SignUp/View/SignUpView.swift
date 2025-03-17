//
//  SignUpView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/18/25.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            SignUpStepsView(stepReached: $viewModel.stepReached)
            
            Group {
                switch viewModel.stepReached {
                case .first: FirstSignUpView(viewModel: viewModel)
                case .second: SecondSignUpView(viewModel: viewModel)
                case .third: ThirdSignUpView(viewModel: viewModel)
                case .final: FinalSignUpView()
                }
            }
        }
        .padding(.horizontal)
        .withBackground()
    }
}

#Preview {
    SignUpView()
}
