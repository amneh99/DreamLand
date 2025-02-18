//
//  DreamLandApp.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/12/25.
//

import SwiftUI

@main
struct DreamLandApp: App {
    @State private var currentScreen: AppMainView = .splash
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch currentScreen {
                case .splash: SplashView()
                        //.transition(.opacity)
                case .login: LoginView()
                        //.transition(.opacity)
                }
            }
            .animation(.easeIn(duration: 0.5), value: currentScreen)
            .onAppear {
                if currentScreen == .splash {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        currentScreen = .login
                    }
                }
            }
        }
    }
}


enum AppMainView {
    case splash
    case login
}
