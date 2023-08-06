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
            VStack {
                VStack{
                    Button(action: vm.toggleLocationList) {
                        Text(vm.mapLocation.name + ", " + vm.mapLocation.district)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(alignment: .leading){
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                    }
                    if vm.showList{
                        Locationlist()
                    }
                }
                .background(.thinMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 0)
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
                
                Spacer()
                
                ZStack(alignment: .bottom){
                    ForEach(vm.restaurantsdata){ location in
                        if vm.mapLocation == location{
                            Locationpreview(restaurant: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                        }
                    }
                }
            }
            .sheet(item: $vm.infoRestaurant, onDismiss: nil){
                inforestaurant in Locationrestaurantinfo(restaurant: inforestaurant)
            }
        }
    }
}

struct Locationview_Previews: PreviewProvider {
    static var previews: some View {
        Locationview()
            .environmentObject(Locationviewmodel())
    }
}
