//
//  ContentView.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var onboardingManager: OnboardingManager

    var body: some View {
        NavigationView {
            Group {
                if onboardingManager.hasCompletedOnboarding {
                    MainView()
                } else {
                    OnboardingView()
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(SettingsManager())
        .environmentObject(OnboardingManager())
}

