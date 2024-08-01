//
//  TopLatestMoviePreview.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 13/07/24.
//

import SwiftUI
import Kingfisher

struct TopLatestMoviePreview: View {
    var movie:Movie
    
    func isCatLast(cat:String)->Bool{
        let catCOunt = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat){
            if index + 1 != catCOunt{
                return false
            }
        }
        return true
    }
    var body: some View {
        ZStack{
            KFImage(movie.thumbnailURL).resizable().scaledToFill().clipped()
            VStack{
                Spacer()
                HStack{
                    ForEach(movie.categories, id: \.self) { cat in
                        HStack{
                            Text(cat).font(.footnote)
                            if !isCatLast(cat: cat){
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack{
                    Spacer()
                    SmallVerticalButton(text: "My List",
                                        isOn: true,
                                        isOnImage: "checkmark",
                                        isOffImage: "plus"){
                        //action
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill"){
                        
                    }.frame(width: 120)
                    Spacer()
                    SmallVerticalButton(text: "Info",
                                        isOn: true,
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle"){
                        
                    }
                    Spacer()

                }

            }//VStack
            .background(
                LinearGradient.blackOpGrad.padding(.top,250)
            )
        }//ZStack
        .foregroundColor(.white)
    }
}

struct TopLatestMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopLatestMoviePreview(movie: exampleMovie1)
    }
}
