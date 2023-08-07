//
//  Restaurant-row.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//
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

struct Restaurant_row: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            //Item row
            restaurant.image
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(15)
            Text(restaurant.name)
        }
    }
}

struct Restaurant_row_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                Restaurant_row(restaurant: restaurants[2])
                    .previewLayout(.fixed(width: 300, height: 70))
                Restaurant_row(restaurant: restaurants[1])
                    .previewLayout(.fixed(width: 300, height: 70))
            }
        }
}
