//
//  HomeView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/22/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            supriseBoxView()
            
            //mainBookCover()
            
            top5()
            
            newReleases()
        }
        .padding(.horizontal)
        .padding(.bottom)
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
            
            HStack(spacing: 6) {
                
                Image(.clock)
                
                Text("2h 23m")
                    .foregroundStyle(.gray)
                    .customFont(.medium(12))
            }
        }
    }
    
    func newReleases() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("New Releases")
                .styledText(weight: .bold(16))
            
            ScrollView(.horizontal) {
                HStack(spacing: 4) {
                    ForEach(viewModel.newReleases, id: \.self) { newRelease in
                        newReleaseCell(newRelease)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    func newReleaseCell(_ newRelease: BookInfo) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            BookCoverCard(image: newRelease.image, title: newRelease.title, duration: newRelease.time)
            
            Spacer()
        }
        .frame(width: 150)
    }
    
    func top5() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Top 5 in Jordan")
                .styledText(weight: .bold(16))
            
            ScrollView(.horizontal) {
                HStack(spacing: 22) {
                    ForEach(Array(viewModel.top5.enumerated()), id: \.element) { (index, top5) in
                        top5Cell(top5, index: index)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    func top5Cell(_ top5: BookInfo, index: Int) -> some View {
        VStack(alignment: .listRowSeparatorTrailing) {
            HStack(alignment: .bottom,spacing: -5) {
                Image(viewModel.top5Numbersimages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 90)
                
                VStack(alignment: .leading, spacing: 8) {
                    Image(top5.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 150)
                        .clipShape(.rect(cornerRadius: 6))
                }
            }
        }
        .frame(width: 180)
    }
}

#Preview {
    MainTabView()
}

private class ViewModel: ObservableObject {
    @Published var newReleases: [BookInfo] = [
        BookInfo(image: .bookCover2, title: "3 Minutes Fairy Tales", time: 220),
        BookInfo(image: .bookCover3, title: "Unborn Illustrated Fairy Tales", time: 100),
        BookInfo(image: .bookCover4, title: "Hello Friend!", time: 15),
        BookInfo(image: .bookCover5, title: "Emma's Beach Adventure", time: 120),
        BookInfo(image: .bookCover6, title: "Liam and Ava's Magical Paper Boat Adventure", time: 76),
    ]
    
    @Published var top5: [BookInfo] = [
        BookInfo(image: .bookCover7, title: "Unborn Illustrated Fairy Tales", time: 100),
        BookInfo(image: .bookCover8, title: "Hello Friend!", time: 1),
        BookInfo(image: .bookCover9, title: "Emma's Beach Adventure", time: 1),
        BookInfo(image: .bookCover10, title: "Liam and Ava's Magical Paper Boat Adventure", time: 1),
        BookInfo(image: .bookCover11, title: "Liam and Ava's Magical Paper Boat Adventure", time: 1)

    ]
    
    var top5Numbersimages: [ImageResource] = [
        .top1, .top2, .top3, .top4, .top5
    ]
}

