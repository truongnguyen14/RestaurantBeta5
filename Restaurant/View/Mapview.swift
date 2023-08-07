/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 05/08/2023 (e.g. 31/07/2023)
  Last modified: 07/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI
import CoreLocation
import MapKit

struct Mapview: View {
    
    @EnvironmentObject private var lvm: Locationviewmodel
    @State private var region = MKCoordinateRegion()
    let restaurant: Restaurant
    
    var body: some View {
        
        //Map pin
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: restaurant.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))),
            annotationItems: [restaurant]) {
            restaurant in MapMarker(coordinate: restaurant.locationCoordinate)
        }
            .allowsHitTesting(false)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        Mapview(restaurant: restaurants[8]).environmentObject(Locationviewmodel())
    }
}
