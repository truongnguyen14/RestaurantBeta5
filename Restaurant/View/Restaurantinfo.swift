//
//  Restaurantinfo.swift
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
import CoreLocation

struct Restaurantinfo: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Color("Yellow").edgesIgnoringSafeArea(.all)
            ScrollView {

                VStack {
                    Mapview(coordinate: restaurant.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 350)
                    CircleImage(image: restaurant.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    Text(restaurant.name)
                        .font(.system(size: 40))
                        .padding(.trailing, 250)
                        .padding(.top, 22)
                    Text(restaurant.address)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .frame(width: 280)
                        .foregroundColor(Colorconstant.Iron)
                        .padding(.trailing, 180)
                        .multilineTextAlignment(.center)
                    Divider()
                        .frame(width: 355, height: 2)
                        .foregroundColor(.black)
                        .overlay(.black)
                    Text(restaurant.description)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
                }
            }
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
        .bold()
    }
    
}

struct Restaurantinfo_Previews: PreviewProvider {
    static var previews: some View {
        Restaurantinfo(restaurant: restaurantsdata[0])
    }
}
