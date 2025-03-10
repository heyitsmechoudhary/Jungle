//
//  GalleryView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct insertGalleryView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment: .center, spacing: 15 ){
                ForEach(animal.gallery,id: \.self ) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }//:HSTACK
        }//: SCROLL
    }
}
//MARK: - PREVIEW
#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")

    insertGalleryView(animal: animals[0])
}
