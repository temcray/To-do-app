//
//  NewGroupView.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/14/26.
//

import SwiftUI

struct NewGroupView: View {
    @Environment(\.dismiss) var dismiss
    @State private var groupName = ""
    @State private var selectedIcon = "list.bullet"
    var onSave: (TaskGroup) -> Void
    let icons = ["list.bullet", "bookmark.fill", "graduationcap.fill", "cart.fill", "house.fill", "heart.fill", "star.fill", "flag.fill"]
    
    var body: some View {
        NavigationStack{
            Form{
                // SECTION 1: TITLE
                Section("Group Name"){
                    TextField("Type in Here", text: $groupName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .frame(width: 250)
                }
                
                
                // SECTION 2: ICON
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 40,))]){
                    ForEach(icons, id: \.self) { icon in
                        Image(systemName:icon)
                            .font(.title2)
                            .frame(width:40, height: 40)
                            .background(selectedIcon == icon ? Color.blue.opacity(0.2) : Color.clear)
                            .foregroundStyle(selectedIcon == icon ? Color.blue : Color.gray)
                            .clipShape(Circle())
                            .onTapGesture {
                                selectedIcon = icon
                            }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("New Group")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {dismiss() }
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button("Save"){
                        let newGroup = TaskGroup(title: groupName, SymbolName: selectedIcon, tasks:[])
                        onSave(newGroup)
                        dismiss()
                    }
                    .disabled(groupName.isEmpty)
                }
            }
        }
        
    }
}
