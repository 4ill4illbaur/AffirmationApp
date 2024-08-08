//
//  AffirmationData.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//


import Foundation

struct AffirmationData {
    static let affirmations: [Affirmation] = [
        // "Love"
        Affirmation(text: NSLocalizedString("love_affirmation_1", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_2", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_3", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_4", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_5", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_6", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_7", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_8", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_9", comment: ""), category: .love, language: .english),
        Affirmation(text: NSLocalizedString("love_affirmation_10", comment: ""), category: .love, language: .english),
        
        // "Friendship"
        Affirmation(text: NSLocalizedString("friendship_affirmation_1", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_2", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_3", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_4", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_5", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_6", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_7", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_8", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_9", comment: ""), category: .friendship, language: .english),
        Affirmation(text: NSLocalizedString("friendship_affirmation_10", comment: ""), category: .friendship, language: .english),
    ]
}


extension AffirmationData {
    static func saveAffirmationsToUserDefaults() {
        let encodedData = try? JSONEncoder().encode(affirmations)
        UserDefaults.standard.set(encodedData, forKey: "affirmations")
    }
}

extension AffirmationData {
    static func initializeAffirmations() {
        if UserDefaults.standard.data(forKey: "affirmations") == nil {
            saveAffirmationsToUserDefaults()
            print("Affirmations initialized and saved to UserDefaults")
        }
    }
}


extension AffirmationData {
    static func loadAffirmationsFromUserDefaults() -> [Affirmation] {
        guard let data = UserDefaults.standard.data(forKey: "affirmations") else {
            return affirmations
        }
        
        let decodedAffirmations = try? JSONDecoder().decode([Affirmation].self, from: data)
        return decodedAffirmations ?? affirmations 
    }
}



