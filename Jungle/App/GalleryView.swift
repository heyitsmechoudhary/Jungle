//
//  GalleryView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    @State private var selectedAnimal : String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    // SIMPLE GRID DEFINATION
    //let GridLayout : [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //
    //]
    
    // EFFICIENT GRID DEFINATION
    @State var GridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                //MARK: - SELECTED ANIMAL
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                //MARK: - GRID
                LazyVGrid(columns: GridLayout, alignment: .center,spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }//: GRID
            }//: VSTACK
            .padding(.horizontal,10)
            .padding(.vertical,50)
        }//: SCROLL
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MptionAnimationView())
    }
}

//MARK: - PREVIEW
#Preview {
    GalleryView()
}
