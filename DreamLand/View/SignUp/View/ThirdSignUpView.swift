//
//  ThirdSignUpView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct ThirdSignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    let options = ["Mother", "Father", "Grandparent", "Other"]
    @State private var selectedOption: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 22) {
                HStack(spacing: 0) {
                    Text("What Is Your Relationship To ")
                    Text("Saad")
                        .foregroundStyle(.pastelOrange)
                    Text("?")
                }
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
                
                Spacer()
            }
            
            DlMainButton(title: "Next") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.5)) {
                    viewModel.stepReached = .final
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
