//
//  SignUpViewModel.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/18/25.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var stepReached: SignUpStep = .first
    @Published var selectedAvatar: AvatarSelection?
    @Published var name: String = ""
    @Published var selectedGender: Gender?
}
