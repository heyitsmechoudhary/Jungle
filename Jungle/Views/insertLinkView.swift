//
//  insertLinkView.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import SwiftUI

struct insertLinkView: View {
    //MARK: - PROPERTIES
    var animal : Animal
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia Link")
                
                Spacer()
                Group{
                    Link(animal.name,destination: ((URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org/"))!))
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }//: HSTACK
        }//:BOX
    }
}

//MARK: - PREVIEW
#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    insertLinkView(animal: animals[0])
}
