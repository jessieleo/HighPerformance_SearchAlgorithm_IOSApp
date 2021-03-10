//
//  fastcity_trackTests.swift
//  fastcity_trackTests
//
//  Created by Seyit Kaya on 9.03.2021.
//

import XCTest
@testable import fastcity_track

class fastcity_trackTests: XCTestCase {
    


    let cities: [City] = [
        .init(country: "US", name: "Alabama", id:4829764, coord: .init(latitude: 32.750408, longitude: -86.750259)),
        .init(country: "US", name: "Albuquerque", id: 5454711, coord: .init(latitude: 35.084492, longitude: -106.651138)),
        .init(country: "US", name: "Anaheim", id: 5323810, coord: .init(latitude: 33.835289, longitude: -117.914497)),
        .init(country: "US", name: "Arizona", id: 5551752, coord: .init(latitude: 34.500301, longitude: -111.500977)),
        .init(country: "AU", name: "Sydney", id: 2147714, coord: .init(latitude: -33.867851, longitude: 151.207321))
    ]
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


  
  
    func testRightSearches() {
        //   If the given prefix is "A", all cities but Sydney should appear.
        //   Contrariwise, if the given prefix is "s", the only result should be "Sydney, AU".
        //   If the given prefix is "Al", "Alabama, US" and "Albuquerque, US" are the only results.
        //   If the prefix given is "Alb" then the only result is "Albuquerque, US"
        //
        
        let searchManager = CitySearchManager(cities: cities)
        print("cities:", searchManager.cities)

        var search = "s"
        searchManager.filter(search: search)
        var index = search.initial!.index
        var subRange = searchManager.results[index]
        XCTAssert(
            searchManager.cities[index][subRange] == [
                City(country: "AU", name: "Sydney", id: 2147714, coord: .init(latitude: -33.867851, longitude: 151.207321))
            ]
        )
        
        search = "A"
        searchManager.filter(search: search)
        index = search.initial!.index
        subRange = searchManager.results[index]
        XCTAssert(
            searchManager.cities[index][subRange] == [
                .init(country: "US", name: "Alabama", id:4829764, coord: .init(latitude: 32.750408, longitude: -86.750259)),
                .init(country: "US", name: "Albuquerque", id: 5454711, coord: .init(latitude: 35.084492, longitude: -106.651138)),
                .init(country: "US", name: "Anaheim", id: 5323810, coord: .init(latitude: 33.835289, longitude: -117.914497)),
                .init(country: "US", name: "Arizona", id: 5551752, coord: .init(latitude: 34.500301, longitude: -111.500977))
            ]
        )
        
        search = "Al"
        searchManager.filter(search: search)
        index = search.initial!.index
        subRange = searchManager.results[index]
        XCTAssert(
            searchManager.cities[index][subRange] == [
                .init(country: "US", name: "Alabama", id: 4829764, coord: .init(latitude: 32.750408, longitude: -86.750259)),
                .init(country: "US", name: "Albuquerque", id: 5454711, coord: .init(latitude: 35.084492, longitude: -106.651138))
            ]
        )
        
        search = "Alb"
        searchManager.filter(search: search)
        index = search.initial!.index
        subRange = searchManager.results[index]
        XCTAssert(
            searchManager.cities[index][subRange] == [
                .init(country: "US", name: "Albuquerque", id: 5454711, coord: .init(latitude: 35.084492, longitude: -106.651138)),
            ]
        )

    }
    
}
