//
//  Restaurant.swift
//  restaurant-ios
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Restaurant: Identifiable, Codable{
    var id: Int
    var name: String
    var address: String
    var description: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
