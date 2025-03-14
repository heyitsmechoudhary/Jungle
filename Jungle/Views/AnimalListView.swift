//
//  AnimalListView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct AnimalListView: View {
    //MARK: - PROPERTIES
    let animal  : Animal
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90,height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
            }//: VSTACK
        }
    }
}

//MARK: - PREVIEW
#Preview {
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    AnimalListView(animal: animals[1])
}
