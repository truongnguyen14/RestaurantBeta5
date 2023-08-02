//
//  Restaurant-row.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//

import SwiftUI

struct Restaurant_row: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            restaurant.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(restaurant.name)
        }
    }
}

struct Restaurant_row_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                Restaurant_row(restaurant: restaurants[0])
                    .previewLayout(.fixed(width: 300, height: 70))
                Restaurant_row(restaurant: restaurants[1])
                    .previewLayout(.fixed(width: 300, height: 70))
            }
        }
}
