//
//  FavouritesView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/22/25.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject private var viewModel = ViewModel()
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.favs, id: \.self) { fav in
                BookCoverCard(image: fav.image, title: fav.title, duration: fav.time)
                    .overlay(alignment: .topTrailing) {
                        favIcon()
                            .padding(3)
                    }
            }
        }
        .padding()
    }
    
    func favIcon() -> some View {
        Image(.favBookIcon)
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .padding(6)
            .background {
                Circle()
                    .fill(.gray.opacity(0.4), strokeBorder: .white, lineWidth: 2)
            }
    }
}

#Preview {
    MainTabView()
}

private class ViewModel: ObservableObject {
    @Published var favs: [BookInfo] = [
        BookInfo(image: .bookCover12, title: "Brume", time: 100),
        BookInfo(image: .bookCover13, title: "Ultralazer", time: 1),
        BookInfo(image: .bookCover14, title: "The Secret Ingredient", time: 1),
        BookInfo(image: .bookCover15, title: "One Jar of Magic text test tstrete ", time: 1),
        BookInfo(image: .bookCover16, title: "The House on Hoarder Hill", time: 1)

    ]
}
