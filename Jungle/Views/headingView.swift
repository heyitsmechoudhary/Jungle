//
//  headingView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct headingView: View {
    //MARK: - PROPERTIES
    var headingImage : String
    var headingText : String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical,8)
    }
}


//MARK: - PREVIEW
#Preview {
    
    headingView(headingImage: "photo.on.rectangle.angled", headingText: "wildeness in pictures")
}
