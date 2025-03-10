//
//  mapAnnotationView.swift
//  Jungle
//
//  Created by Rahul choudhary on 09/03/25.
//

import SwiftUI

struct mapAnnotationView: View {
    
    //MARK: - PROPERTIES
    var location : NationalParklocation
    @State private var animation : Double = 0.0
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width:54,height: 54,alignment: .center)
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52, height: 52,alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48,alignment: .center)
                .clipShape(Circle())
        }//: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2.0).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}


//MARK: - PREVIEW
#Preview {
    let locations : [NationalParklocation] = Bundle.main.decode("locations.json")
    mapAnnotationView(location: locations[0])
}
