//
//  OnboardingView.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 04.08.2024.
//
import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @EnvironmentObject var settingsManager: SettingsManager
    
    @State private var selectedCategory: Category = .love
    @State private var selectedColor: Settings.BackgroundColor = .blue // Обновлено
    @State private var selectedGender: Settings.Gender = .male
    @State private var currentPage = 0

    var body: some View {
        TabView(selection: $currentPage) {
            // Экран выбора категории
            VStack {
                Text("Choose Category")
                    .font(.largeTitle)
                Picker("Category", selection: $selectedCategory) {
                    ForEach(Category.allCases) { category in
                        Text(category.description).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Button("Next") {
                    withAnimation {
                        currentPage = 1
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .tag(0)
            
            // Экран выбора цвета фона
            VStack {
                Text("Choose Background Color")
                    .font(.largeTitle)
                Picker("Background Color", selection: $selectedColor) {
                    ForEach(Settings.BackgroundColor.allCases) { color in
                        Text(color.description).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Button("Next") {
                    withAnimation {
                        currentPage = 2
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .tag(1)
            
            // Экран выбора пола
            VStack {
                Text("Choose Gender")
                    .font(.largeTitle)
                Picker("Gender", selection: $selectedGender) {
                    Text("Male").tag(Settings.Gender.male)
                    Text("Female").tag(Settings.Gender.female)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Button("Get Started") {
                    settingsManager.settings.selectedCategory = selectedCategory
                    settingsManager.settings.backgroundColor = selectedColor // Обновлено
                    settingsManager.settings.gender = selectedGender
                    settingsManager.saveSettings()
                    onboardingManager.hasCompletedOnboarding = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardingManager())
        .environmentObject(SettingsManager())
}
