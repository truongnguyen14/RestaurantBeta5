//
//  Modeldata.swift
//  Restaurant
//
//  Created by Truong, Nguyen Tan on 02/08/2023.
//

import Foundation
import CoreLocation

var restaurants = decodeJsonFromJsonFile(jsonFileName: "restaurants.json")

// How to decode a json file into a struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Restaurant] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Restaurant].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Restaurant]
}
