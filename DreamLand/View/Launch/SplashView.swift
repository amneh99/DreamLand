//
//  SplashView.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/14/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(.mainLogo)
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: -90)
        }
        .withBackground()
    }
}

#Preview {
    SplashView()
}
