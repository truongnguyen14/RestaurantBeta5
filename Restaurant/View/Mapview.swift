//
//  Map.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 29/07/2023.
//

import SwiftUI
import MapKit
struct Mapview: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Mapview(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))}
}
