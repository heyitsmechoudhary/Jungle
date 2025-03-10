//
//  VideoModel.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import SwiftUI

struct Video : Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
//    computed Properties
    var thumbnail : String {
        "video-\(id)"
    }
}
