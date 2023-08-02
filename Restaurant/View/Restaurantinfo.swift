//
//  Restaurantinfo.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 29/07/2023.
//

import SwiftUI
import CoreLocation

struct Restaurantinfo: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Color("Bisque").edgesIgnoringSafeArea(.all)
            ScrollView {
                
                VStack {
                    Text(restaurant.name)
                        .font(.system(size: 25))
                    Mapview(coordinate: restaurant.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 350)
                    CircleImage(image: restaurant.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(restaurant.name)
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    Text(restaurant.description)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
    
}

struct Restaurantinfo_Previews: PreviewProvider {
    static var previews: some View {
        Restaurantinfo(restaurant: restaurants[0])
    }
}
