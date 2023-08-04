//
//  Restaurant.swift
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


import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct Restaurant: Identifiable{
    var id: Int
    var name: String
    var address: String
    var description: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    var locationCoordinate: CLLocationCoordinate2D
        
    
}


