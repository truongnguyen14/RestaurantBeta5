//
//  Locationviewmodel.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 05/08/2023.
//

import SwiftUI
import MapKit

struct Locationview: View {
    @EnvironmentObject private var vm: Locationviewmodel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.restaurantsdata, annotationContent: { location in
                MapMarker(coordinate: location.locationCoordinate)
            })
                .ignoresSafeArea()
        }
    }
}

struct Locationview_Previews: PreviewProvider {
    static var previews: some View {
        Locationview()
            .environmentObject(Locationviewmodel())
    }
}
