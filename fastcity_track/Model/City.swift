//
//  City.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import UIKit
import MapKit

struct City: Decodable, Hashable {
    
    let country: String
    let name: String
    
    let id: Int
    let coord: Coordinate
    
    private enum CodingKeys: String, CodingKey  {
        case country, name, id = "_id", coord
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Coordinate: Decodable {
    let latitude, longitude: Double
    private enum CodingKeys: String, CodingKey  {
        case latitude = "lat", longitude = "lon"
    }
}

extension City {
    var coordinate2D: CLLocationCoordinate2D { .init(latitude: coord.latitude, longitude: coord.longitude) }
}

extension City: Comparable {
    
    static func < (lhs: City, rhs: City) -> Bool {
        lhs.nameAndCountry < rhs.nameAndCountry
    }
    
    static func == (lhs: City, rhs: City) -> Bool {
        lhs.id == rhs.id
    }
    
    var nameAndCountry: String { name + ", " + country }
    
}
