//
//  MainTabView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 3/17/25.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = TabBarItem.home
    var body: some View {
        VStack {
            Spacer()
            
            TabView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .padding(.bottom, 12)
        .withBackground()
    }
}

#Preview {
    MainTabView()
}
