//
//  AnimaGridItemView.swift
//  Jungle
//
//  Created by Rahul choudhary on 10/03/25.
//

import SwiftUI

struct AnimaGridItemView: View {
    //MARK: - PROPERTIES
    let animal : Animal
    //MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: - PREVIEW
#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")

    AnimaGridItemView(animal: animals[0])
}
