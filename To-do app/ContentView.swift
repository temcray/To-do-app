//
//  ContentView.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var taskGroups : [TaskGroup] = []
    @State private var selectedGroup: TaskGroup?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isShowingAddGroup = false
    @State private var isDarkMode = false
    @Environment(\.scenePhase) private var scenePhase
    let saveKey = "SavedTaskGroup"
    @Environment(\.dismiss) private var dismiss
    @Binding var porfile: Profile
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility){
            List(selection: $selectedGroup){
                ForEach(porfile.groups) {group in
                    NavigationLink(value: group){
                        
                        
                        Label(group.title, systemImage: group.SymbolName)
                    }
                }
            }
            .navigationTitle("profile.name")
            .listStyle(.sidebar)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.primary)
                            .padding(8)
                            .background(Circle().fill(Color.primary.opacity(0.1)))
                        
                        
                    }
                    
                }
                ToolbarItem(placment: .primaryAction){
                    
                    
                    Button{
                        
                        
                        
                        isShowingAddGroup = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            isDarkMode.toggle()
                        } label: {
                            Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                        }
                    }
                }
                //.preferredColorScheme(isDarkMode ? .dark : .light)
            }detail: {
                if let group = selectedGroup {
                    if let index = profile.groups.firstIndex(where: {$0.id == group.id}){
                        TaskGroupDetailView(groups: $profile.groups[index])
                    }
                } else {
                    ContentUnavailableView("Select a group", image: "sidebar.left")
                }
                
            }
            
            
            
            .sheet(isPresented: $isShowingAddGroup){
                NewGroupView { newGroup in
                    taskGroups.append(newGroup)
                    selectedGroup = newGroup
                }
            }
            
            .onAppear{
                loadData()
            }
            .onChange(of: scenePhase){ oldValue, newValue in
                if newValue == .active{
                    print("App is Active")
                } else if newValue == .inactive {
                    print("Look out user is going out (Inactive)")
                } else if newValue == .background{
                    print("background")
                    saveData()
                }
                
            }
        }
        
        func saveData(){
            if let encodedData = try? JSONEncoder().encode(profile.groups){
                UserDefaults.standard.set(encodedData, forKey: saveKey)
            }
        }
        
        func loadData(){
            if let saveData = UserDefaults.standard.data(forKey: saveKey){
                if let decodedGroups = try? JSONDecoder().decode([profile.groups].self, from: saveData){
                    
                    
                    profile.groups = decodedGroups
                    return
                }
            }
            if profile.groups.isEmpty{
                profile.groups = profile.groups.sampleData
            }
        }
    }
    
    
    
    
}
