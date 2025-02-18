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
        VStack {
           // SignUpStepsView(stepReached: $viewModel.stepReached)
            Spacer()
        }
        .withBackground()
    }
}

#Preview {
    SignUpView()
}
