//
//  CityViewModel.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import Foundation
import CoreLocation

class CityViewModel {
    let displayName: String
    let displayCoordinate: String
    let coord: CLLocationCoordinate2D
    
    init(with city: City) {
        self.displayName = "\(city.name), \(city.country)"
        self.displayCoordinate = "\(city.coord.lon), \(city.coord.lat) "
        self.coord = city.coordinate2D
    }
}
