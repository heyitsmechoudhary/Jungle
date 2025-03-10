//
//  VideoListView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact  = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        videoListView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }//:LIST
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        //Suffle
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            
            
        }//NAVIGATION
    }
}

//MARK: - PREVIEW
#Preview {
    VideoListView()
}
