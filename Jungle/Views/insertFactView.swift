//
//  FactView.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import SwiftUI

struct insertFactView: View {
    //MARK: - PROPERTIES
    let animal : Animal
    
    //MARK: - BODDY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact,id: \.self) { item in
                    Text(item)
                }
            }//:TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:148,idealHeight: 168,maxHeight: 180)
        }//: BOX
    }
}

//MARK: - PREVIEW
#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    insertFactView(animal: animals[0])
}
