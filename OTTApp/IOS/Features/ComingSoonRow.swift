//
//  ComingSoonRow.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    var movie:Movie
    @Binding var movieDetaialsToShow:Movie?
    let screen = UIScreen.main.bounds
    
    var player : AVPlayer {
        AVPlayer(url: exampleVideoURL)
    }
    
    var body: some View {
        VStack{
            VideoPlayer(player: player)
                .frame(height:200)
            
            VStack{
                HStack{
                    KFImage(movie.thumbnailURL).resizable().aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width/3,height: 75).clipped()
                    Spacer()
                    Button {
                        //
                    } label: {
                        VStack(spacing: 6){
                            Image(systemName: "bell").font(.title3)
                            Text("Remindme")
                        }
                    }.padding(.horizontal)
                    
                    Button {
                        movieDetaialsToShow = movie
                    } label: {
                        VStack(spacing: 6){
                            Image(systemName: "info.circle").font(.title3)
                            Text("Info")
                        }
                    }.padding(.trailing,20)

                }.font(.caption)
                
                VStack(alignment: .leading){
                    Text(movie.name).bold().font(.title2)
                    Text(movie.episodeDecriptionDisplay).foregroundColor(.gray).font(.subheadline)
                }
            }.foregroundColor(.white)
                .padding(.horizontal)
        }
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            ComingSoonRow(movie: exampleMovie1, movieDetaialsToShow: .constant(nil))
        }
    }
}
