//
//  HomeHeaderView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/22/25.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(.avatarBoy1)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("Saad Ayman")
                .styledText(weight: .bold(16))
            
            Spacer()
            
            Image(.star)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Button {
                
            } label: {
                Image(.settings)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
            }
            
        }
    }
}

#Preview {
    HomeHeaderView()
}
