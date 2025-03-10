//
//  AnimalModel.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct Animal : Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    var description: String
    var link: String
    var image: String
    var gallery: [String]
    var fact: [String]
}
