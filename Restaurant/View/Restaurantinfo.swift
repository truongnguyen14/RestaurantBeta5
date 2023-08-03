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
            Color("Yellow").edgesIgnoringSafeArea(.all)
            ScrollView {

                VStack {
                    Text(restaurant.name)
                        .font(.system(size: 20))
                        .bold()
                        .padding(.top, -88)
                        //.padding(.bottom, -1020)
                    Mapview(coordinate: restaurant.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 350)
                    CircleImage(image: restaurant.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(restaurant.name)
                        .font(.system(size: 40))
                        .padding(.trailing, 240)
                        .padding(.top, 22)
                    Text(restaurant.address)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 280)
                        .foregroundColor(Colorconstant.Iron)
                        .padding(.trailing, 190)
                        .multilineTextAlignment(.center)
                    Divider()
                        .frame(width: 350, height: 2)
                        .foregroundColor(.black)
                        .overlay(.black)
                    Text(restaurant.description)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
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
