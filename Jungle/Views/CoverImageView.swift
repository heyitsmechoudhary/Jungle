//
//  CoverImageView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    let coverImage : [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//:LOOP
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK: - PREVIEW
#Preview {
    CoverImageView()
}
