//
//  TaskModels.swift
//  To-do app
//
//  Created by Tatiana6mo on 5/12/26.
//

import Foundation
import Combine

struct TaskItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TaskGroup: Identifiable, Hashable, Codable {
    var id = UUID()
    var  title: String
    var SymbolName: String
    var tasks: [TaskItem]
}

struct Profile: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var profileImage: String
    var groups: [TaskGroup]
}

extension TaskGroup {
    static let sampleData: [TaskGroup] = [
        TaskGroup(title: "School", SymbolName: "book.fill", tasks:   [
            TaskItem(title: "Do Homework"),
            TaskItem(title: "Examn", isCompleted: true)
        ]),
        
        TaskGroup(title: "Home", SymbolName: "house.fill", tasks: [
            TaskItem(title: "Buy cat food", isCompleted: true)
        ])
    ]
}

extension Profile {
    static let sampleData: [Profile] = [
        Profile(name: "profile", profileImage: "student_en 1", groups: TaskGroup.sampleData),
        Profile(name: "Student", profileImage: "school", groups: []),
    ]
}

