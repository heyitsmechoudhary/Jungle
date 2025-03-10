//
//  AnimalDetailView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center, spacing: 20) {
                
                // 1. HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // 2. TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    )
                // 3. HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                
                // 4. GALLERY
                Group{
                    headingView(headingImage: "photo.on.rectangle.angled", headingText: "wildeness in pictures")
                    insertGalleryView(animal: animal)
                }
                
                .padding(.horizontal)
                
                // 5. FACTS
                Group{
                    headingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    insertFactView(animal: animal)
                }
                .padding()
                
                // 6. DESCRIPTION
                Group{
                    headingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding()
                
                // 7. MAP
                
                Group{
                    headingView(headingImage: "map", headingText: "National Parks")
                    insertMapView()
                }
                .padding()
                
                // 8. LINK
                Group{
                    headingView(headingImage: "books.vertical", headingText: "Learn more")
                    insertLinkView(animal: animal)
                }
                .padding()
                
            }//: VSTACK
            .navigationBarTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }//: SCROLL
    }
}

//MARK: - PREVIEW
#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    NavigationView {
        AnimalDetailView(animal: animals[3])
    }
}
