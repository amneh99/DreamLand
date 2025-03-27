//
//  HomeView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/22/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            HomeHeaderView()
            
            supriseBoxView()
            
            mainBookCover()
        }
        .padding(.horizontal)
    }
    
    func supriseBoxView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(.stepsPurple)
                .opacity(0.2)
                .frame(height: 200)
            
            VStack(spacing: 12) {
                Image(.supriseBox)
                
                Text("Suprise Box For Today!")
                    .styledText(weight: .medium(16))
            }
        }
    }
    
    func mainBookCover() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(.bookCover1)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(.rect(cornerRadius: 6))
            
            Text("It's Time To Study")
                .styledText(weight: .medium(16))
            
            HStack {
                
                Text("2h 23m")
                    .foregroundStyle(.gray)
                    .customFont(.medium(12))
            }
        }
    }
}

#Preview {
    MainTabView()
}
