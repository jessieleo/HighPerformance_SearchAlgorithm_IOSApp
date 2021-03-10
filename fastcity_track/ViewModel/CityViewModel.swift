//
//  CityViewModel.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import Foundation
import CoreLocation

class CityViewModel {
    
    let cityAndCountry: String
    let coordinate2D: CLLocationCoordinate2D
    
    init(with city: City) {
        self.cityAndCountry = city.name + ", " + city.country
        self.coordinate2D = city.coordinate2D
    }
    
}

extension CityViewModel {
    var coordinateDetail: String {
        "Latidude: " + String(format: "%0.6f", coordinate2D.latitude) + " / " +
        "Longitude: " + String(format: "%0.6f", coordinate2D.longitude)
    }
}

