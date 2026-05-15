//
//  ContentView.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var taskGroups = TaskGroup.sampleData
    @State private var selectedGroup: TaskGroup?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var isShowingAddGroup = false
    @State private var isDarkMode = false
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility){
            List(selection: $selectedGroup){
                ForEach(taskGroups) {group in
                    NavigationLink(value: group){
                        
                        
                        Label(group.title, systemImage: group.SymbolName)
                    }
                }
            }
            .navigationTitle("Tracker ToDo App")
            .listStyle(.sidebar)
            
            .toolbar{
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
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }detail: {
            if let group = selectedGroup {
                if let index = taskGroups.firstIndex(where: {$0.id == group.id}){
                    TaskGroupDetailView(groups: $taskGroups[index])
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
    }
}

#Preview {
    ContentView()
}
