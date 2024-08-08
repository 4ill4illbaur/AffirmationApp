//
//  SettingsManager.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//

//import Foundation
//import Combine
//import SwiftUI
//
//
//class SettingsManager: ObservableObject {
//    @Published private(set) var settings: Settings
//
//    init() {
//        self.settings = loadSettings()
//    }
//
//    private func saveSettings() {
//        do {
//            let encodedData = try JSONEncoder().encode(settings)
//            UserDefaults.standard.set(encodedData, forKey: "settings")
//        } catch {
//            print("Ошибка при сохранении настроек: \(error)")
//        }
//    }
//
//    private func loadSettings() -> Settings {
//        guard let savedData = UserDefaults.standard.data(forKey: "settings") else {
//            return Settings()
//        }
//
//        do {
//            let decodedSettings = try JSONDecoder().decode(Settings.self, from: savedData)
//            return decodedSettings
//        } catch {
//            print("Ошибка при загрузке настроек: \(error)")
//            return Settings()
//        }
//    }
//}
//
//struct Settings: Codable {
//    var selectedCategory: String = "love"
//    var backgroundColor: RGBColor = RGBColor(from: .green)
//    var gender: Gender = .male
//    var preferredLanguage: Language = .english
//   
//
//    enum CodingKeys: CodingKey {
//        case selectedCategory
//        case backgroundColor
//        case gender
//        case preferredLanguage
//    }
//    
//}
//
//
//struct RGBColor: Codable {
//    let red: Double
//    let green: Double
//    let blue: Double
//
//    enum CodingKeys: String, CodingKey {
//        case red = "r" // Если в JSON ключ называется "r"
//        case green = "g"
//        case blue = "b"
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        red = try container.decode(Double.self, forKey: .red)
//        green = try container.decode(Double.self, forKey: .green)
//        blue = try container.decode(Double.self,
// forKey:
// .blue)
//    }
//}
//
//
//enum Gender: String, Codable {
//    case male
//    case female
//}
//
//enum PreferredLanguage: String, Codable {
//    case english
//    case russian
//}
