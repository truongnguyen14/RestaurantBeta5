/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 02/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI
import CoreLocation
import MapKit

struct Restaurantinfo: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        ZStack {
            //Background color
            Color("Yellow").edgesIgnoringSafeArea(.all)

            ScrollView {
                
                //Restaurants information and map
                VStack {
                    MapView
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 350)
                        .padding(.top, 100)
                    CircleImage(image: restaurant.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(restaurant.name)
                        .font(.system(size: 40))
                        .padding(.top, 22)
                        .frame(width: 350, alignment: .leading)
                    Text(restaurant.address)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(Colorconstant.Iron)
                        .multilineTextAlignment(.leading)
                    Text(restaurant.district)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(Colorconstant.Iron)
                        .multilineTextAlignment(.center)
                    Text("Tel: \(restaurant.phone)")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(Colorconstant.Iron)
                        .multilineTextAlignment(.center)
                    Text("Price range: \(restaurant.price)")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 350, alignment: .leading)
                        .foregroundColor(Colorconstant.Iron)
                        .multilineTextAlignment(.center)
                    Divider()
                        .frame(width: 355, height: 2)
                        .foregroundColor(.black)
                        .overlay(.black)
                    Text ("About \(restaurant.name)")
                        .font(.system(size: 30))
                        .frame(width: 380, alignment: .center)
                        .padding(.top, 30)
                    Text(restaurant.description)
                        .font(.system(size: 24))
                        .fontWeight(.light)
                        .frame(width: 360, alignment: .center)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 5)
                        .padding(.bottom, 50)
                }
                
                Spacer()
                
                //Direct URL reservation button
                VStack{
                    Divider()
                        .frame(width: 355, height: 2)
                        .foregroundColor(.black)
                        .overlay(.black)
                    Text("Contact for reservation")
                        .font(.system(size: 30))
                        .frame(width: 400, alignment: .center)
                        .padding(.top, 30)
                }
                Contactwebsite(text: restaurant.name, url: restaurant.url, imageName: "phone.fill")
                    .padding()
                    .padding(.bottom, 24)
            }
        }
        .ignoresSafeArea()
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
        .bold()
    }
}

struct Restaurantinfo_Previews: PreviewProvider {
    static var previews: some View {
        Restaurantinfo(restaurant: restaurants[0]).environmentObject(Locationviewmodel())
    }
}

//Use extension
extension Restaurantinfo{
    
    //Map pin function
    private var MapView: some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: restaurant.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))),
            annotationItems: [restaurant]) {
            restaurant in MapMarker(coordinate: restaurant.locationCoordinate)
        }
            .allowsHitTesting(false)
    }
}
