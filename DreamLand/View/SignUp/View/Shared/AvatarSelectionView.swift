//
//  AvatarSelectionView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/21/25.
//

import SwiftUI

struct AvatarSelectionView: View {
    @Binding var selectedAvatar: AvatarSelection?
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 17) {
                ForEach (AvatarSelection.allCases, id: \.self) { avatar in
                    Image(avatar.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .overlay {
                            if selectedAvatar == avatar {
                                Circle()
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.mint)
                            }
                        }
                        .onTapGesture {
                            selectedAvatar = avatar
                        }
                }
                .padding(5)
            }
        }
        .scrollIndicators(.hidden)
        .frame(height: 150)
    }
}

#Preview {
    AvatarSelectionView(selectedAvatar: .constant(nil))
        .withBackground()
}

enum AvatarSelection: CaseIterable {
    case mainGirl
    case mainBoy
    case girl1
    case girl2
    case girl3
    case boy1
    case boy2
    case boy3
    
    var image: ImageResource {
        switch self {
        case .mainGirl: .mainAvatarGirl
        case .mainBoy: .mainAvatarBoy
        case .girl1: .avatarGirl1
        case .girl2: .avatarGirl2
        case .girl3: .avatarGirl3
        case .boy1: .avatarBoy1
        case .boy2: .avatarBoy2
        case .boy3: .avatarBoy3
        }
    }
}
