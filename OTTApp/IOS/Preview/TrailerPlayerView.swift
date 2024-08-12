//
//  TrailerPlayerView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videURL:URL?
    @Binding var playVideo:Bool
    
    var body: some View {
        if videURL != nil{
            VideoPlayer(url: videURL!, play: $playVideo)
        }else{
            Text("Could not load video")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videURL:nil, playVideo: .constant(true))
    }
}
