//
//  To_do_appUITests.swift
//  To-do appUITests
//
//  Created by Tatiana6mo on 5/12/26.
//

import XCTest

final class To_do_appUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func testLaunchInEnglish() throws {
        // 1. FORCE THE APP TO LAUNCH IN A LANGUAGE
        app.launchArguments = ["-AppleLanguages", "(en)"]
        app.launch()
        
        let header = app.staticTexts["Who is working today?"]
        XCTAssertTrue(header.exists, "The english header was not found")
        
    }
    
    func testLaunchInSpanish() throws {
        app.launchArguments = ["-AppleLanguages", "(es)"]
        app.launch()
        
        let header = app.staticTexts["¿Quién trabaja hoy?"]
        XCTAssertTrue(header.exists,  "The spanish header was not found")
    }
    
    func testLaunchInIrish() throws {
        app.launchArguments = ["-AppleLanguages", "(ga)"]
        app.launch()
        
        let header = app.staticTexts["Cúplaigh go raibh maith agat?"]
        XCTAssertTrue(header.exists, "The irish header was not found")
    }
    
    func testCreateNewTaskGroup(){
        app.launch()
        
        let profileCard = app.buttons["ProfileCard_Professor"]
        XCTAssertTrue(profileCard.exists)
        profileCard.tap()
        
        app.buttons["SaveGroupButton"].tap()
        
        XCTAssertTrue(app.staticTexts["GroupLink_Testing Group"].exists)
    }
    
    
    func testNavigateToTaskGroup(){
        app.launch()
        
        // 1. SELECT THE PROFESSOR PROFILE FROM THE DASHBOARD
        let profileButton = app.buttons[""]
        XCTAssertTrue(profileButton.exists, "The professor card was not visible at the home screen")
        profileButton.tap()
        
        
        // 2. IDENTIFY AND TAP THE 'GROCERIES' GROUP IN THE SIDE BAR
        let selectedGroup = app.buttons[""]
        XCTAssertTrue(selectedGroup.waitForExistence(timeout: 2), "The groceries list was never found to be tapped")
        selectedGroup.tap()
        
        // 3. COMPARE AND CONFIRM THAT THE NAVIGATION TITLE IS THE SAME AS THE NAME OF THE SELECTED GROUP AND SHOW THE TASK DETAILS OF THIS GROUP
        
        let detailTitle = app.navigationBars[""]
        XCTAssertTrue(detailTitle.exists, "The navigation bar should display")
        
        
        
        
    }
    
    
}
