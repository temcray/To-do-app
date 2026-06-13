//
//  To_do_appTests.swift
//  To-do appTests
//
//  Created by Tatiana6mo on 5/12/26.
//

import XCTest
@testable import To_do_app

final class To_do_AppTest: XCTestCase {
    
    
    func testTaskItemDefaultDate() {
        let task = TaskItem(title: "Grade papers", isCompleted: false)
        
        XCTAssertEqual(task.title, "Grade papers")
        XCTAssertFalse(task.isCompleted, "New task should not have their inCompled as true initially")
        XCTAssertEqual(task.priority, .medium, "A new task should default to medium priority" )
    }
    
    // TEST: CALCULATION LOGIC
    func testGroupCalculation() {
        let tasks = [
            TaskItem(title: "Task 1", isCompleted: true),
            TaskItem(title: "Task 2", isCompleted: true),
            TaskItem(title: "Task 3", isCompleted: true),
            TaskItem(title: "Task 4", isCompleted: true)
        ]
        
        let completedCount =  tasks.filter {$0.isCompleted}.count
            let Progress = tasks.isEmpty ? 0 : Double(completedCount) / Double(tasks.count)
        }
    
    //
    }


