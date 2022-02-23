//
//  MapStoreController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import Foundation
import UIKit
import SnapKit
import MapKit

// MARK: Constants

fileprivate struct Constants {
    static let identificator = "annotation"
    static let mapHeightDevider: CGFloat = 5
}

class MapStoreController: UIViewController {
    
    // MARK: Property
    
    private var shops = Shops()
    
    private let shopsMap = MKMapView()
    
    // MARK: APP Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMap()
        addShopsOnMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: Methods for create views
    
    private func createMap() {
        shopsMap.delegate = self
        view.addSubview(shopsMap)
        print(view.frame)
        
        shopsMap.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.left.equalToSuperview()
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height - view.frame.height / Constants.mapHeightDevider)
        }
    }
    
    private func addShopsOnMap() {
        shops.shops.forEach { shop in
            let point = MKPointAnnotation()
            point.title = shop.name
            point.subtitle = shop.phoneNumber
            point.coordinate = CLLocationCoordinate2D(
                latitude: shop.latitude,
                longitude: shop.longitude
            )
            shopsMap.addAnnotation(point)
        }
    }
}

// MARK: MKMapViewDelegate

extension MapStoreController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let annotationView = MKPinAnnotationView(
            annotation: annotation,
            reuseIdentifier: Constants.identificator
        )
        //annotationView.canShowCallout = true
        return annotationView
    }
}

