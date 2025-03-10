//
//  ContentView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")

    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListView(animal: animal)
                    }
                }
            }//:LIST
            .navigationBarTitle("Jungle",displayMode: .large)
        }//: NAVIGATION
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
