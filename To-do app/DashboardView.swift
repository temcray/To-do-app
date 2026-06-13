//
//  DashboardView.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/26/26.
//

import SwiftUI

struct DashboardView: View {
    @State private var profiles: [Profile] = Profile.sampleData
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var path = NavigationPath()
    
    let colums = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        
    ]
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                VStack(spacing: 40){
                    VStack{
                        Text("Welcome Back")
                            .font(.subheadline)
                            .textCase(.uppercase)
                        Text("Who is working today?")
                            .font(.caption)
                    }
                    LazyVGrid(columns: colums, spacing: 25){
                        ForEach($profiles) {  $profile in
                            NavigationLink(value: profile){
                            Image(profile.profileImage)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text(profile.name)
                                .fontWeight(.bold)
                                }
                        .buttonStyle(PlainButtonStyle())
                        .accessibilityIdentifier("ProfileCard_\(profile.name)")
                              
                            }
                        }
                    .padding(.horizontal)
                    }
                }
            .navigationTitle("Home")
            .navigationDestination(for: Profile.self){ selectedProfile in
                if let index = profiles.firstIndex(where: {$0.id == selectedProfile.id} ){
                    ContentView(profile: $profiles[index])
                }
                
            }
            }
        }
    }

