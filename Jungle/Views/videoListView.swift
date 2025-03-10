//
//  videoListView.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import SwiftUI

struct videoListView: View {
    //MARK: - PROPERTIES
    var video : Video
    //MARK: - BODY
    var body: some View {
        HStack (spacing: 10){
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(12)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 8)
            }//: ZSTACK
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }//: HSTACK
    }
}
//MARK: - PREVIEW
#Preview {
    let videos : [Video] = Bundle.main.decode("videos.json")
    videoListView(video: videos[0])
}
