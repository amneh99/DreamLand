//
//  FirstSignUpView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct FirstSignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 18) {
                IntroductionView()
                
                Text("Let Your Child Choose:")
                    .styledText(weight: .medium(16))
                
                AvatarSelectionView(selectedAvatar: $viewModel.selectedAvatar)
                
                DlTextField(text: $viewModel.name, placeholder: "Your child's name?")
                
                DlTextField(text: $viewModel.name, placeholder: " Your child's birthday?")
                
                Text("Your child's gender?")
                    .styledText(weight: .medium(16))
                
                genderSelectionView()
                
                Spacer()
            }
            
            
            DlMainButton(title: "Next") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.5)) {
                    viewModel.stepReached = .second
                }
            }
            .frame(width: 120)
            .padding(.bottom)
        }
    }
    
    func IntroductionView() -> some View {
        HStack(spacing: 15) {
            Image(.yellowStar)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Text("Let's Customize Dreamland For Your Child!")
                .styledText(weight: .medium(14))
        }
    }
    
    func genderSelectionView() -> some View {
        HStack {
            Spacer()
            
            ForEach(Gender.allCases, id: \.self) { avatar in
                Image(avatar.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .overlay {
                        if viewModel.selectedGender == avatar {
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundStyle(.mint)
                        }
                    }
                    .onTapGesture {
                        viewModel.selectedGender = avatar
                    }
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}

enum Gender: CaseIterable {
    case male
    case femail
    
    var image: ImageResource {
        switch self {
        case .male: .mainAvatarBoy
        case .femail: .mainAvatarGirl
        }
    }
}
