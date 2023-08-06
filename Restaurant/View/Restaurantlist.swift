/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 1
 Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
 ID: 3754703(e.g. 1234567)
 Created  date: 02/08/2023 (e.g. 31/07/2023)
 Last modified: 06/08/2023 (e.g. 05/08/2023)
 Acknowledgement: Acknowledge the resources that you use here.
 */

import SwiftUI

struct Restaurantlist: View {
    @AppStorage("isDarkMode") private var Dark = false
    @State private var searchItem: String = ""
    
    var body: some View {
        NavigationView {
            TabView {
                ZStack {
                    VStack{
                        List(restaurants){
                            restaurant in
                            NavigationLink{
                                Restaurantinfo(restaurant: restaurant)
                            } label: {
                                Restaurant_row(restaurant: restaurant)
                            }
                        }
                    }
                }
                .navigationBarItems(leading: Text("Restaurants")
                    .font(.system(size: 40)
                        .bold()
                    )
                )
                .tabItem(){
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                Locationview().environmentObject(Locationviewmodel())
                    .tabItem(){
                        Image(systemName: "map.fill")
                        Text("Map")
                    }
            }
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    Button(action:{Dark.toggle()}, label:{ Dark ? Label("Dark", systemImage: "lightbulb.fill") : Label("Dark", systemImage: "lightbulb")
                    })
                }
            }
        }
        .environment(\.colorScheme, Dark ? .dark : .light)
    }
}

struct Restaurantlist_Previews: PreviewProvider {
    static var previews: some View {
        Restaurantlist()
    }
}
