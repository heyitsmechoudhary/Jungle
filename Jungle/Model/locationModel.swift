//
//  locationModel.swift
//  Jungle
//
//  Created by Rahul choudhary on 09/03/25.
//

import Foundation
import MapKit

struct NationalParklocation: Codable, Identifiable {
    
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    //Computed Property
    var loction: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
