//
//  Map.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//
/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Your name (e.g. Nguyen Van Minh)
  ID: Your student id (e.g. 1234567)
  Created  date: 02/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI
import MapKit
import UIKit


struct Mapview: View {
    var coordinate: CLLocationCoordinate2D
    //var name: String
    
    @State private var region = MKCoordinateRegion()
    @EnvironmentObject private var vm: 
    
    var body: some View {
        Map(coordinateRegion: $region).onAppear()
            {
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
