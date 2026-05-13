//
//  TaskGroupDetailView.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/12/26.
//

import SwiftUI

struct TaskGroupDetailView: View {
    @Binding var groups: TaskGroup
    
    var body: some View{
        List{
            ForEach($groups.tasks) {$task in
                HStack{
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(task.isCompleted ? .yellow : .gray)
                        .onTapGesture{
                            withAnimation{
                                task.isCompleted.toggle()
                            }
                        }
                    TextField("Task Title", text: $task.title)
                        .strikethrough(task.isCompleted)
                        .foregroundStyle(task.isCompleted ? .brown : .gray)
                }
            }
            .onDelete { index in
                groups.tasks.remove(atOffsets: index)
            }
        }
        .navigationTitle(groups.title)
        .toolbar{
            Button("Add Task"){
                withAnimation {
                    groups.tasks.append(TaskItem(title: ""))
                }
            }
        }
    }
}
