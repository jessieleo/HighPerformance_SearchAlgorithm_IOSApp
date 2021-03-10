//
//  MapLocationVC.swift
//  fastcity_track
//
//  Created by Seyit on 09.03.2021.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapLocationVC: UIViewController, MKMapViewDelegate {
    
    let mapView = MKMapView()
    
    fileprivate var centerCoordinates: CLLocationCoordinate2D?
    fileprivate var cityName: String?
    
    init(with city: CityViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.centerCoordinates = city.coordinate2D
        self.cityName = city.cityAndCountry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let centerCoordinates = centerCoordinates, let cityName = cityName else { return }
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: centerCoordinates,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.region = coordinateRegion
        title = cityName
        view = mapView
    }
}
