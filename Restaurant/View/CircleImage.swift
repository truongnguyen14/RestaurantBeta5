//
//  CircleImage.swift
//  ContactList
//
//  Created by Truong, Nguyen Tan on 29/07/2023.//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.white),lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("restaurant1"))
    }
}
