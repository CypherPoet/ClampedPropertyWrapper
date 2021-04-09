//
// Test.swift
// 
//
// Created by CypherPoet on 4/8/21.
// ✌️
//

import XCTest
import ClampedPropertyWrapper


private let minLuminosity: Double = 1.0
private let maxLuminosity: Double = 2_000_000_000_000.0


class ClampedPropertyWrapperTests: XCTestCase {
}


// MARK: - Lifecycle
extension ClampedPropertyWrapperTests {

    override func setUpWithError() throws {
        // Put setup code here.
        // This method is called before the invocation of each
        // test method in the class.
        try super.setUpWithError()
    }


    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}


// MARK: - Tests: Core Functionality
extension ClampedPropertyWrapperTests {

    func test_Initializing_WithinRange_UsesProvidedValue() throws {
        struct Galaxy {
            @Clamped(within: minLuminosity...maxLuminosity)
            var luminosity: Double = minLuminosity
        }
        
        let galaxy = Galaxy(luminosity: minLuminosity + 10)
        
        XCTAssertEqual(galaxy.luminosity, minLuminosity + 10)
    }
    
    
    func test_Setting_WithinRange_SetsToProvidedValue() throws {
        struct Galaxy {
            @Clamped(within: minLuminosity...maxLuminosity)
            var luminosity: Double = minLuminosity
        }
        
        var galaxy = Galaxy()
        let newValue = minLuminosity + 10
        
        galaxy.luminosity = newValue
        
        XCTAssertEqual(galaxy.luminosity, newValue)
    }
    
    
    func test_Setting_BelowRange_SetsToLowerBound() throws {
        struct Galaxy {
            @Clamped(within: minLuminosity...maxLuminosity)
            var luminosity: Double = minLuminosity
        }
        
        var galaxy = Galaxy()
        let newValue = minLuminosity - 10
        
        galaxy.luminosity = newValue
        
        XCTAssertEqual(galaxy.luminosity, minLuminosity)
    }
    
    
    func test_Setting_AboveRange_SetsToUpperBound() throws {
        struct Galaxy {
            @Clamped(within: minLuminosity...maxLuminosity)
            var luminosity: Double = minLuminosity
        }
        
        var galaxy = Galaxy()
        let newValue = maxLuminosity + 10
        
        galaxy.luminosity = newValue
        
        XCTAssertEqual(galaxy.luminosity, maxLuminosity)
    }
}


// MARK: - Test Initializing with Custom Arguments
extension ClampedPropertyWrapperTests {

//    func test_Init_WhenCreatedWithCustom[ARG_NAME]_DoesSomething() throws {
//
//    }
}
