//
//  TrailerListView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 23/07/24.
//

import SwiftUI

struct TrailerListView: View {
    var trailers:[Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack{
            ForEach(trailers) { trailer in
                VStack(alignment: .leading){
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(width: screen.width)
                    
                    Text(trailer.name).font(.headline)
                }.foregroundColor(.white)
                .padding(.bottom,10)
            }
        }
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            TrailerListView(trailers: exampleMovieTrailers)
        }
    }
}
