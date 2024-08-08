//
//  Affirmation.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//

import Foundation

struct Affirmation: Codable {
    let text: String
    let category: String
    let language: String
}

extension Affirmation {
    init(text: String, category: Category, language: Language) {
        self.text = text
        self.category = category.rawValue
        self.language = language.rawValue
    }
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case love
    case friendship

    var id: String { rawValue }
    var description: String { rawValue.capitalized }
}

enum Language: String, Codable, CaseIterable, Identifiable {
    case russian = "ru"
    case english = "en"

    var id: String { rawValue }
    var description: String { rawValue.capitalized }
}
