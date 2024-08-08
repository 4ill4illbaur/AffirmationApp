//
//  SettingsView.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        Form {
            Section(header: Text("Category")) {
                Picker("Category", selection: $settingsManager.settings.selectedCategory) {
                    ForEach(Category.allCases) { category in
                        Text(category.description).tag(category)
                    }
                }
            }
            
            Section(header: Text("Background Color")) {
                Picker("Background Color", selection: $settingsManager.settings.backgroundColor) {
                    Text("Blue").tag(Settings.BackgroundColor.blue)
                    Text("Red").tag(Settings.BackgroundColor.red)
                }
            }
            
            Section(header: Text("Gender")) {
                Picker("Gender", selection: $settingsManager.settings.gender) {
                    Text("Male").tag(Settings.Gender.male)
                    Text("Female").tag(Settings.Gender.female)
                }
            }
            
            Section(header: Text("Language")) {
                Button("Change Language") {
                    openAppSettings()
                }
            }
        }
        .navigationTitle("Settings")
        .onDisappear {
            settingsManager.saveSettings()
        }
    }
    
    private func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsManager())
}



