//
//  VideoPreviewImage.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 23/07/24.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    var imageURL:URL
    var videoURL:URL
    @State private var showingVideoPlayer = false
    
    var body: some View {
        ZStack{
            KFImage(imageURL).resizable().aspectRatio(contentMode: .fit)
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle").foregroundColor(.white).font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer) {
                VideoView(url: videoURL)
            }

        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleVideoImageURL, videoURL: exampleVideoURL)
    }
}
