//
//  BackgroundModifier.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/12/25.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .safeAreaInset(edge: .top, spacing: 0) {
                    Color.clear.frame(height: safeAreaInsets.top)
                }
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    Color.clear.frame(height: safeAreaInsets.bottom)
                }
        }
    }
    
    private var safeAreaInsets: UIEdgeInsets {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return .zero
        }
        return window.safeAreaInsets
    }
}

extension View {
    func withBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
