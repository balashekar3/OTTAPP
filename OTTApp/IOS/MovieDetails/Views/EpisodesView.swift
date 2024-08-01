//
//  EpisodesView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 30/07/24.
//

import SwiftUI

struct EpisodesView: View {
    var episodes:[Episods]
    @Binding var showSeassonPicker:Bool
    @Binding var selectedSeasson:Int
    
    func getEpisode(forSesson seasson:Int)->[Episods]{
        return episodes.filter({$0.season == seasson})
    }

    var body: some View {
        VStack(spacing: 14){
            HStack{
                Button {
                    showSeassonPicker = true
                } label: {
                    Group{
                        Text("Season \(selectedSeasson)")
                        Image(systemName: "chevron.down")
                    }.font(.system(size: 16))

                }

                Spacer()
            }
            
            ForEach(getEpisode(forSesson: selectedSeasson)) { episode in
               
                VStack(alignment: .leading){
                    HStack{
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120,height: 70)
                            .clipped()
                            .padding(.leading,-30)
                        
                        VStack(alignment: .leading){
                            Text("\(episode.episodeNumber). \(episode.name)").font(.system(size: 16))
                            Text("\(episode.length)min").font(.system(size: 12)).foregroundColor(.gray)
                        }.padding(.leading,-30)

                        Spacer()
                        
                        Image(systemName: "arrow.down.to.line.alt").font(.system(size: 20))
                    }
                    //discription
                    Text(episode.discription)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom,20)
            }
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal,20)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            EpisodesView(episodes: allExampleEpisodes, showSeassonPicker: .constant(false), selectedSeasson: .constant(1))

        }
    }
}
