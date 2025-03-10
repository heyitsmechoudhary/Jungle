//
//  VideoPlayerView.swift
//  Jungle
//
//  Created by Rahul choudhary on 08/03/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    var videoSelected : String
    var videoTitle : String
    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected, format: "mp4")){
//                Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8),
                alignment: .topLeading
            )
        }//:VSTACK
        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - PREVIEW
#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
    }
}
