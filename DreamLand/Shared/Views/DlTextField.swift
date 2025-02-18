//
//  DlTextField.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/15/25.
//

import SwiftUI

struct DlTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            TextField("", text: $text)
                .padding()
                .customFont(.medium(16))
                .foregroundStyle(.textFieldGrayTC)
                .background(.textFieldGrayBG)
                .clipShape(.rect(cornerRadius: 12))
                .frame(height: 56)
            
            Text(placeholder)
                .customFont(.regular(16))
                .foregroundColor(.textFieldGrayTC)
                .offset(y: isFocused || !text.isEmpty ? -27 : 0)
                .scaleEffect(isFocused || !text.isEmpty ? 0.8 : 1, anchor: .topLeading)
                .animation(.spring(response: 0.45, dampingFraction: 0.45), value: isFocused || !text.isEmpty)
                .padding(.leading)
        }
    }
}

#Preview {
    DlTextField(text: .constant(""), placeholder: "test")
        .padding()
}
