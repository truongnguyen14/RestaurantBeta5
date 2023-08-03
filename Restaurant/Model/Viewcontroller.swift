//
//  Viewcontroller.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 03/08/2023.
//

import Foundation
import UIKit
import MapKit

class Viewcontroller: UIViewController{
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        mapView.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(
            center: annontation.coordinate,
            latitudinalMeters: 100,
            longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
}
