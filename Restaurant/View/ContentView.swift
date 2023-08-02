//
//  ContentView.swift
//  restaurant-ios
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Restaurant_row(restaurant: restaurants[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
