//
//  AffirmationAppApp.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//

import SwiftUI

extension NSNotification.Name {
    static let backgroundColorChanged = NSNotification.Name("backgroundColorChanged")
}

@main
struct YourApp: App {
    @StateObject private var settingsManager = SettingsManager()
    @StateObject private var onboardingManager = OnboardingManager()
    
    init() {
        AffirmationData.initializeAffirmations()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsManager)
                .environmentObject(onboardingManager)
                .preferredColorScheme(colorScheme(for: settingsManager.settings.backgroundColor))
        }
        .onChange(of: settingsManager.settings.backgroundColor) { newValue in
            NotificationCenter.default.post(name: .backgroundColorChanged, object: newValue)
        }
    }
    
    private func colorScheme(for backgroundColor: Settings.BackgroundColor) -> ColorScheme? {
        switch backgroundColor {
        case .blue: //
            return .light
        case .red:
            return .dark 
        }
    }
}



