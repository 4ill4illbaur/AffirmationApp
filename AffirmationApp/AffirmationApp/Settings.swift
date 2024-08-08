//
//  Settings.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.


import Foundation

struct Settings: Codable {
    var selectedCategory: Category = .love
    var gender: Gender = .male
    var selectedLanguage: Language = .english
    var backgroundColor: BackgroundColor = .blue
    
    enum Gender: String, Codable {
        case male
        case female
    }

    enum Language: String, Codable, CaseIterable, Identifiable {
        case russian = "ru"
        case english = "en"
        
        var id: String { rawValue }
        var description: String { rawValue.capitalized }
    }

    enum BackgroundColor: String, Codable, CaseIterable, Identifiable {
        case blue
        case red
        
        var id: String { rawValue }
        var description: String { rawValue.capitalized }
    }
}



class SettingsManager: ObservableObject {
    @Published var settings = Settings()

    init() {
        loadSettings()
    }

    func loadSettings() {
        if let data = UserDefaults.standard.data(forKey: "settings") {
            if let decodedSettings = try? JSONDecoder().decode(Settings.self, from: data) {
                settings = decodedSettings
            }
        }
    }

    func saveSettings() {
        if let encodedData = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(encodedData, forKey: "settings")
        }
    }
}

