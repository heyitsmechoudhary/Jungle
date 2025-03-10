//
//  CenterModifier.swift
//  Jungle
//
//  Created by Rahul choudhary on 10/03/25.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
            
    }
}
