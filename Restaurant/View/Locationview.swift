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
    
    @EnvironmentObject private var lvm: Locationviewmodel
    
    var body: some View {
        ZStack{
            
            //Map shows location view
            Map(coordinateRegion: $lvm.mapRegion, annotationItems: lvm.restaurantsdata, annotationContent: { location in
                MapMarker(coordinate: location.locationCoordinate)
            })
                .ignoresSafeArea()
            
            //Header
            VStack {
                VStack{
                    Button(action: lvm.toggleLocationList) {
                        Text(lvm.mapLocation.name + ", " + lvm.mapLocation.district)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(alignment: .leading){
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.red)
                                    .padding()
                            }
                    }
                    if lvm.showList{
                        Locationlist()
                    }
                }
                .background(Colorconstant.Yellow)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.8), radius: 20, x: 0, y: 0)
                .padding()
                .frame(maxHeight: .infinity, alignment: .top)
                
                Spacer()
                
                //Bottom preview card
                ZStack(alignment: .bottom){
                    ForEach(lvm.restaurantsdata){ location in
                        if lvm.mapLocation == location{
                            Locationpreview(restaurant: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                        }
                    }
                }
            }
            
            //Use sheet to perform back button
            .sheet(item: $lvm.infoRestaurant, onDismiss: nil){
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
