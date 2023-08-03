//
//  Restaurantlist.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 29/07/2023.
//

import SwiftUI

struct Restaurantlist: View {
    @AppStorage("isDarkMode") private var Dark = false
    var body: some View {
        NavigationView {
            VStack{List(restaurants){
                restaurant in
                NavigationLink{
                    Restaurantinfo(restaurant: restaurant)
                } label: {
                    Restaurant_row(restaurant: restaurant)
                }
                .navigationTitle("Restaurants")
            }
            }
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    Button(action:{Dark.toggle()}, label:{ Dark ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb")
                        
                    })
                }
                           
            }
        }.environment(\.colorScheme, Dark ? .dark : .light)
    }
}

struct Restaurantlist_Previews: PreviewProvider {
    static var previews: some View {
        Restaurantlist()
    }
}
