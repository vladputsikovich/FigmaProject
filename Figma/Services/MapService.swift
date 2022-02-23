//
//  MapService.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 9.02.22.
//

import Foundation
import MapKit
import CoreLocation

class MapService {
    func infoCurrentLocation(location: CLLocation, name: String, phoneNumber: String, completionHandler: @escaping (StoreAnotation?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            guard let placemark = placemarks?[0] else { return }
            let storeAnnotation = StoreAnotation(
                name: name,
                street: placemark.thoroughfare ?? "",
                city: placemark.locality ?? "",
                phoneNumber: phoneNumber
            )
            completionHandler(storeAnnotation)
        })
    }
}
