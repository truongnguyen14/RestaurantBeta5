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
    
    //List of restaurant locations
    @Published var showList: Bool = false
    
    //Show Restaurant info
    @Published var infoRestaurant: Restaurant? = nil
    
    init() {
        let restaurants = restaurants
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
    
    public func toggleLocationList(){
        withAnimation(.easeInOut){
            showList = !showList
        }
    }
    
    public func showLocation(location: Restaurant){
        withAnimation(.easeInOut){
            mapLocation = location
            showList = false
        }
    }
    
    public func nextLocationbutton(){
        // Get current location
        guard let currentLocation = restaurantsdata.firstIndex(where: { $0 == mapLocation})
        else {
            print("Could not find current location")
            return
        }
        
        //Check the current location is valid
        let nextLocation = currentLocation + 1
        guard restaurantsdata.indices.contains(nextLocation)
        else {
            guard let firstlocation = restaurantsdata.first else { return }
            showLocation(location: firstlocation)
            return
        }
        
        //Next location is valid
        let nextLocation2 = restaurantsdata[nextLocation]
        showLocation(location: nextLocation2)
    }
}
