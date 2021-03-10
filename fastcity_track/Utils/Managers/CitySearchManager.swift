//
//  CitySearchManager.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import UIKit

class CitySearchManager {
    
    static let shared = CitySearchManager()

    // 2D Array containing all elements indexed
    var cities: [[City]] = .init(repeating: [], count: 27)
    
    // visible items indices
    var ranges: [Range<Int>] = .init(repeating: 0..<0, count: 27)
    
    // the last search string
    var lastSearch = ""
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "cities", withExtension: "json")!
            
            try JSONDecoder().decode([City].self, from: url.data())
                .forEach {
                self.cities[$0.name.initial?.index ?? 26].append($0)
            }
            cities.indices.forEach {
                cities[$0].localizedStandardSort(\.nameAndCountry)
            }
            ranges = cities.map(\.indices)

        }
        catch {
            print("Could not parse JSON error:", error)
        }
    }
    
    func filter(search: String) {
        print(#function)
        let start = CFAbsoluteTimeGetCurrent()
        
        if search.isEmpty {
            // If search is empty, all items are visible
            ranges = cities.map(\.indices)
        } else if search.count == 1 {
            let index = search.initial?.index ?? 26
            ranges = .init(repeating: 0..<0, count: 27)
            ranges[index] = cities[index].indices
        } else {
            let index = search.initial?.index ?? 26
            // this will restrict the subrange search to the last range if the string length increases and if it decreases it will reset the range for the initial index range
            let subRange: Range<Int> = lastSearch.count < search.count ? ranges[index] : cities[index].indices
            guard
                let firstIndex = cities[index][subRange].binarySearchFirstIndexHasPrefix(where: \.nameAndCountry, prefix: search),
                let lastIndex = cities[index][subRange].binarySearchLastIndexHasPrefix(where: \.nameAndCountry, prefix: search) else {
                // no city found clear the results
                ranges = .init(repeating: 0..<0, count: 27)
                lastSearch = search
                return
            }
            ranges[index] = firstIndex..<lastIndex+1
            lastSearch = search
        }
        
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("🏁🏁🏁 Filter elapsed time measured:  \(diff*1000) miliseconds for 🔎: \(search) 🏁🏁🏁")
    }
}


