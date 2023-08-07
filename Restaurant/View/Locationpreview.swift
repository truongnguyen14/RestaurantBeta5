/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703 (e.g. 1234567)
  Created  date: 04/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

struct Locationpreview: View {
    
    @EnvironmentObject private var lvm: Locationviewmodel
    var restaurant: Restaurant
    
    var body: some View {
        
        //Align the card to the bottom
        HStack(alignment: .bottom) {
            
            //Avartar and name stay left side
            VStack(alignment: .leading){
                ZStack{
                    
                    //Image
                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
                .padding(8)
                .background(Colorconstant.Yellow)
                .cornerRadius(10)
                VStack(alignment: .leading){
                    Text(restaurant.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .padding()
                }
            }
                VStack{
                    
                    //Information button
                    Button {
                        lvm.infoRestaurant = restaurant
                    } label: {
                        Text("Infomation")
                            .font(.headline)
                            .frame(width: 150, height: 40)
                            .background(Color(.black))
                            .foregroundColor(.white)
                    }
                    .cornerRadius(10)
                    
                    //Next location button
                    Button{
                        lvm.nextLocationbutton()
                    } label: {
                        Text("Next location")
                            .font(.headline)
                            .frame(width: 150, height: 40)
                            .background(Color(.black))
                            .foregroundColor(.white)
                    }
                    .cornerRadius(10)
                }
                .padding(.bottom, 20)
        }
        .padding(20)
        
        //Background shape and color
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Colorconstant.Yellow)
                .offset(y: 70)
        )
        .clipped()
    }
}

struct Locationpreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            Locationpreview(restaurant: restaurants[0])
        }
    }
}
