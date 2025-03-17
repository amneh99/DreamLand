//
//  SecondSignUpView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct SecondSignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    @State private var selectedOption: String?
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 22) {
                Text("Do Any Of The Following Apply To Your Child?")
                    .styledText(weight: .medium(16))
                
                VStack(spacing: 20) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedOption = option
                        }) {
                            HStack {
                                Text(option)
                                    .styledText(weight: .medium(16))
                                Spacer()
                            }
                            .padding()
                            .background(selectedOption == option ? Color.pastelPurple2 : Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
                
                Text("This helps us to understand your child and their needs.")
                    .styledText(weight: .medium(16))
                
                Spacer()
            }
            
            DlMainButton(title: "Next") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.5)) {
                    viewModel.stepReached = .third
                }
            }
            .frame(width: 120)
            .padding(.bottom)
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
