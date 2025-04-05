//
//  BookCoverCard.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 4/5/25.
//

import SwiftUI

struct BookCoverCard: View {
    var image: ImageResource
    var title: String
    var duration: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 150)
                .clipShape(.rect(cornerRadius: 6))
            
            Text(title)
                .styledText(weight: .medium(16))
            
            HStack(alignment: .bottom, spacing: 6) {
                
                Image(.clock)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .padding(.bottom, 1)
                
                Text(duration.formatDuration())
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.gray)
                    .customFont(.medium(12))
            }
            
            Spacer()
        }
        //.frame(width: 150)
    }
}

#Preview {
    BookCoverCard(image: .bookCover1, title: "2kj ioiko", duration: 50)
        .withBackground()
}
