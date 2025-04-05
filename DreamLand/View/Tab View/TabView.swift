//
//  TabView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/11/25.
//

import SwiftUI

struct TabView: View {
    @Binding var selectedTab: TabBarItem
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(height: 80)
                .clipShape(.rect(cornerRadii: .init(topLeading: 12, topTrailing: 12)))
            
            HStack {
                ForEach(TabBarItem.allCases, id: \.self) { tab in
                    tabView(tab)
                        .onTapGesture {
                            selectedTab = tab
                        }
                    
                    if tab != .fav {
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 22)
        }
    }
    
    func tabView(_ tab: TabBarItem) -> some View {
        VStack {
            Image(tab.image(isSelected: tab == selectedTab))
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}

enum TabBarItem: CaseIterable {
    case home
    case downloads
    case search
    case fav
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .downloads: return "Downloads"
        case .search: return "Search"
        case .fav: return "My tales"
        }
    }
    
    var selectedImage: ImageResource {
        switch self {
        case .home: return .homeIcon
        case .downloads: return .downloadsIcon
        case .search: return .searchIcon
        case .fav: return .favIcon
        }
    }
    
    var unselectedImage: ImageResource {
        switch self {
        case .home: return .homeUnselectedIcon
        case .downloads: return .downloadsUnselectedIcon
        case .search: return .searchUnselectedIcon
        case .fav: return .favUnselectedIcon
        }
    }
    
    func image(isSelected: Bool) -> ImageResource {
        isSelected ? selectedImage : unselectedImage
    }
}

#Preview {
    TabView(selectedTab: .constant(.home))
        .withBackground()
}
