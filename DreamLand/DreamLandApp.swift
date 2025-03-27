//
//  DreamLandApp.swift
//  DreamLand
//
//  Created by Amneh Shalabyeh on 2/12/25.
//

import SwiftUI

@main
struct DreamLandApp: App {
    @StateObject var appMainView = AppMainView()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appMainView.currentScreen {
                case .splash: SplashView()
                    //.transition(.opacity)
                case .login: LoginView()
                    //.transition(.opacity)
                case .main: MainTabView()
                }
            }
            .animation(.easeIn(duration: 0.5), value: appMainView.currentScreen)
            .onAppear {
                if appMainView.currentScreen == .splash {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        appMainView.currentScreen = .login
                    }
                }
            }
        }
        .environmentObject(appMainView)
    }
}

class AppMainView: ObservableObject {
    @Published var currentScreen = AppMain.splash
    
    enum AppMain {
        case splash
        case login
        case main
    }
}
