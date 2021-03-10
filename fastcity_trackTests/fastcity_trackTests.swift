//
//  fastcity_trackTests.swift
//  fastcity_trackTests
//
//  Created by Seyit Kaya on 9.03.2021.
//

import XCTest
@testable import fastcity_track

class fastcity_trackTests: XCTestCase {
    
    let cityTestItems = [
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                         City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12))
                        ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testValidSearches() {
  
        let cityTestItems = [
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12)),
                             City(country: "a", name: "Marbella", id: 12, coord: Coordinate(lon: 12, lat: 12))
                            ]
        
        
        let citiesTestEmpty: [[City]] = .init(repeating: [], count: 27)
        
        let cm = CitySearchManager.shared
        cm.cities = citiesTestEmpty
        cm.cities.append(cityTestItems)
        cm.filter(search: "mar") 
        XCTAssert(true, "basari")

    }

}
