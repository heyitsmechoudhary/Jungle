//
//  CreditView.swift
//  Jungle
//
//  Created by Rahul choudhary on 10/03/25.
//

import SwiftUI

struct CreditView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128,height: 128)
            
            Text("""
    Copyright © Rahul choudhary
    All rights reserved 
    IIIION SMART TECH PRIVATE LIMITED ♡
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }//: VSTACK
        .padding()
        .opacity(0.4)
    }
}


//MARK: - PREVIEW
#Preview {
    CreditView()
}
