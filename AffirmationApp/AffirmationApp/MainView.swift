//
//  MainView.swift
//  AffirmationApp
//
//  Created by Бауржан Еркен on 05.08.2024.
//


import SwiftUI

struct MainView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @State private var affirmations: [Affirmation] = []
    
    private var backgroundColor: Color {
        switch settingsManager.settings.backgroundColor {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        }
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    
                  Spacer()
                    
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                            .font(.title)
                            .padding()
                            .background(backgroundColor)
                            .clipShape(Circle())
                            .foregroundColor(.black)
                    }
                }
                .background(backgroundColor)
                .padding(.top, 20)

                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 0) {
                        ForEach(affirmations.indices, id: \.self) { index in
                            VStack {
                                Text(affirmations[index].text)
                                    .font(.title2)
                                    .padding()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .background(backgroundColor)
                                    .cornerRadius(10)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .background(backgroundColor)
                            .padding(.top, index == 0 ? -60 : 0)
                        }
                    }
                }
                .background(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            }
            .background(backgroundColor)
            .onAppear {
                loadAffirmations()
            }
        }
    }

    private func loadAffirmations() {
        let allAffirmations = AffirmationData.affirmations
        let selectedCategory = settingsManager.settings.selectedCategory.rawValue
        let selectedLanguage = settingsManager.settings.selectedLanguage.rawValue
        
        
        affirmations = allAffirmations.filter { $0.category == selectedCategory && $0.language == selectedLanguage }
        
        print("Loaded filtered affirmations: \(affirmations)")
    }
}

#Preview {
    MainView()
        .environmentObject(SettingsManager())
}











