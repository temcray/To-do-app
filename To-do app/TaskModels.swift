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
