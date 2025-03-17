//
//  DlMainButton.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/16/25.
//

import SwiftUI

struct DlMainButton: View {
    var title: String
    var callback: () -> Void = {}
    
    var body: some View {
        
        Button {
            callback()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.tesstttttt)
                    .frame(height: 40)
                
                Text(title)
                    .foregroundStyle(.white)
                    .customFont(.medium(16))
            }
        }
    }
}

#Preview {
    DlMainButton(title: "Login!")
        .frame(width: 180)
}
