//
//  MptionAnimationView.swift
//  Jungle
//
//  Created by Rahul choudhary on 10/03/25.
//

import SwiftUI

struct MptionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16 )
    @State private var isAnimating : Bool = false
    
    
    //MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    //MARK: - BODY
    var body: some View {
        GeometryReader {Geometry in
            ZStack {
                ForEach(0...randomCircle,id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinates(max: Geometry.size.width),
                            
                            y: randomCoordinates(max: Geometry.size.width)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.4, damping: 0.6)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//:LOOP
                
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}


//MARK: - PREVIEW
#Preview {
    MptionAnimationView()
}
