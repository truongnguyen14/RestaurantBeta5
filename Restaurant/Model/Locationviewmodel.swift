//
//  Locationviewmodel.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 05/08/2023.
//

import Foundation

class Locationviewmodel: ObservableObject{
    
    @Published var restaurantsdata: [Restaurant]
    @Published var mapLocation: Restaurant
    
    init() {
        let restaurants = Restaurantsdata().restaurantsdata
        self.restaurantsdata = restaurants
        self.mapLocation = restaurants.first!
    }

}
