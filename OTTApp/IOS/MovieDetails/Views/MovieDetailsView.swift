//
//  MovieDetailsView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 17/07/24.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie:Movie
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow : Movie?

    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            movieDetailToShow = nil
                        } label: {
                            Image(systemName: "xmark.circle").font(.system(size: 28))
                        }
                    }//HStack
                    .padding(.horizontal,20)
                    Spacer()
                    ScrollView(.vertical,showsIndicators: true){
                        VStack{
                            MovieInfoSubView(movie: movie)
                            if movie.promotionHeadline != nil{
                                Text(movie.promotionHeadline!).bold().font(.headline)
                            }
                            //PlayButton
                            PlayButtonView()
                            //EpisodInfo
                            EpisodInfoView(movie: movie)
                            //CastInfo
                            CastInfo(movie: movie)
                            HStack(spacing: 50){
                                SmallVerticalButton(text: "My List", isOn: false, isOnImage: "checkmark", isOffImage: "plus") {
                                    //
                                }
                                SmallVerticalButton(text: "Rate", isOn: false, isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup") {
                                    //
                                }
                                SmallVerticalButton(text: "Share", isOn: true, isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up") {
                                    //
                                }
                                Spacer()
                            }.padding(.leading,10)
                            //Custom Tab
                            CustomTabSwitcher(tabs: [.episodes,.trailers,.more], movie: movie, showSeassonPicker: $showSeasonPicker, selectedSeasson: $selectedSeason)
                        }
                    }
                }
            }
            .foregroundColor(.white)
            if showSeasonPicker{
                Group{
                    Color.black.opacity(0.85)
                    VStack(spacing: 20){
                        Spacer()
                        ForEach(0..<(movie.numberOfSeassons ?? 0), id: \.self){ season in
                            Button {
                                selectedSeason = season + 1
                                showSeasonPicker = false
                            } label: {
                                Text("Season \(season)")
                                    .foregroundColor(selectedSeason == season + 1 ?.white : .gray)
                                    .bold()
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                            }
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            self.showSeasonPicker = false
                        } label: {
                            Image(systemName: "x.circle.fill").foregroundColor(.white).font(.system(size: 40)).scaleEffect(x:1.1)
                        }
                        .padding(.bottom,30)
                    }
                }.edgesIgnoringSafeArea(.all)
            }
        }//ZStack
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}

struct MovieInfoSubView: View {
    var movie:Movie
    var screen = UIScreen.main.bounds

    var body: some View {
        StandardHomeMovie(movie: movie)
            .frame(width: screen.width/2.5)
        HStack{
            Image(systemName: "hand.thumbsup.fill").foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.numberOfSeassonsDisplay)
            HDView()
        }
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct RatingView: View {
    var rating:String
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50,height: 20)
    }
}

struct HDView: View {
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.cyan)
            Text("HD").bold().foregroundColor(.white)
        }.frame(width: 30,height: 20)
    }
}

struct CastInfo: View {
    var movie:Movie
    var body: some View {
        VStack(spacing: 3){
            HStack{
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack{
                Text("Director: \(movie.creator)")
                Spacer()
            }
        }.padding(.vertical,5).font(.caption).foregroundColor(.gray)
    }
}

struct EpisodInfoView: View {
    var movie:Movie
    var body: some View {
        Group{
            HStack {
                Text(movie.episodeInfoDisplay).bold()
                Spacer()
            }.padding(.vertical,4)
            HStack {
                Text(movie.episodeDecriptionDisplay).font(.subheadline)
                Spacer()
            }
        }
    }
}

struct PlayButtonView: View {
    var body: some View {
        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
            //
        }
    }
}
