//
//  Locationviewmodel.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 05/08/2023.
//
/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 04/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import MapKit
import SwiftUI

class Locationviewmodel: ObservableObject{
    
    // Loaded locations
    @Published var restaurantsdata: [Restaurant]
    
    // Current location
    @Published var mapLocation: Restaurant{
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
    
    init() {
        let restaurants = Restaurants
        self.restaurantsdata = restaurants
        self.mapLocation = restaurants.first!
        self.updateMapRegion(location: restaurants.first!)
    }
    
    private func updateMapRegion(location: Restaurant){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.locationCoordinate,
                span: mapSpan
            )
        }
    }
}
