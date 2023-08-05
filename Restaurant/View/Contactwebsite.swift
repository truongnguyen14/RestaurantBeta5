/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Nguyen Tan Truong (e.g. Nguyen Van Minh)
  ID: 3754703(e.g. 1234567)
  Created  date: 04/08/2023 (e.g. 31/07/2023)
  Last modified: 06/08/2023 (e.g. 05/08/2023)
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct Contactwebsite: View {
    
    let text: String
    let url: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.black)
            .frame(height: 50.0)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                Link(destination: URL(string: url)!) {
                    Text(text)
                        .foregroundColor(.white)
                }
                
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Contactwebsite_Previews: PreviewProvider {
    static var previews: some View {
        Contactwebsite(text: "123456789", url: "tel:123456789", imageName: "phone.fill")
    }
}
