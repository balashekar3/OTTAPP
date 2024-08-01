//
//  HomeView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 10/07/24.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    var screen = UIScreen.main.bounds
    @State private var movieDetailToShow:Movie? = nil
    @State private var animationAmount = 1.0
    @State private var topRowSelection:HomeTopRow = .home
    @State private var homeGenreType:HomeGenre = .AllGenres
    @State private var showGenreSelection = false
    @State private var showTopBarSelection = false
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView{
                LazyVStack{
                    TopBarView(topRowSelection: $topRowSelection, homeGenreType: $homeGenreType,showGenreSelection:$showGenreSelection,showTopBarSelection:$showTopBarSelection)
                    //TopLatestMoviePreview
                    TopLatestMoviePreview(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top,-120)
                        .zIndex(-1)
                    //TopLatestMoviePreview -End
                    HomeStack(vm: vm, movieDetailToShow: $movieDetailToShow,topRowSelection:topRowSelection,selectedGenre:homeGenreType)
                }//MainLazyVStack
            }//MainScrollView
            if movieDetailToShow != nil {
                MovieDetailsView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn(duration: 1).repeatForever(autoreverses: false),value: animationAmount)
                    .transition(.opacity)
            }
            if showTopBarSelection{
                Group{
                    Color.black.opacity(0.85)
                    VStack(spacing: 30){
                        Spacer()
                        ForEach(HomeTopRow.allCases,id:\.self){ topRow in
                            Button {
                                topRowSelection = topRow
                                showTopBarSelection = false
                            } label: {
                                if topRow == topRowSelection{
                                    Text("\(topRow.rawValue)").bold()
                                }else{
                                    Text("\(topRow.rawValue)").foregroundColor(.gray)
                                }
                            }

                        }//ForEach
                        Spacer()

                        Button {
                            showTopBarSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill").foregroundColor(.white).font(.system(size: 40)).scaleEffect(x:1.1)
                        }.padding(.bottom,30)

                    }
                }.edgesIgnoringSafeArea(.all)
                .font(.title2)
            }//showTopBarSelection
            
            if showGenreSelection{
                Group{
                    Color.black.opacity(0.85)
                    VStack(spacing: 30){
                        Spacer()
                        ScrollView{
                            ForEach(vm.allGenre,id:\.self){ genre in
                                Button {
                                    homeGenreType = genre
                                    showGenreSelection = false
                                } label: {
                                    if genre == homeGenreType{
                                        Text("\(genre.rawValue)").bold()
                                    }else{
                                        Text("\(genre.rawValue)").foregroundColor(.gray)
                                    }
                                }.padding(.bottom,30)

                            }//ForEach
                        }
                       
                        Spacer()

                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill").foregroundColor(.white).font(.system(size: 40)).scaleEffect(x:1.1)
                        }.padding(.bottom,30)

                    }
                }.edgesIgnoringSafeArea(.all)
                .font(.title2)
            }//showGenreSelection
        }
        
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopBarView: View {
    
    @Binding  var topRowSelection:HomeTopRow
    @Binding  var homeGenreType:HomeGenre
    
    @Binding  var showGenreSelection:Bool
    @Binding  var showTopBarSelection:Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack{
                Button {
                    topRowSelection = .home
                } label: {
                    Image("OTT").resizable().scaledToFit().frame(width: 50)
                }.buttonStyle(.plain)
                
                Spacer()
                Button {
                    topRowSelection = .tvShows

                } label: {
                    Text("TVShows")
                }.buttonStyle(.plain)
                
                Spacer()
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }.buttonStyle(.plain)
                Spacer()
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }.buttonStyle(.plain)
            }//HStack
            .foregroundColor(.white)
            .padding(.leading,10)
            .padding(.trailing,30)
        case .tvShows,.movies,.myList:
            HStack{
                Button {
                    topRowSelection = .home
                } label: {
                    Image("OTT").resizable().scaledToFit().frame(width: 50)
                }.buttonStyle(.plain)
                
                HStack(spacing: 20){
                    Button {
                        showTopBarSelection = true
                    } label: {
                        HStack{
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180),anchor: .center)

                        }
                    }.buttonStyle(.plain)
                    
                    Button {
                        showGenreSelection = true
                    } label: {
                        HStack{
                            Text(homeGenreType.rawValue)
                                .font(.system(size: 14))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180),anchor: .center)
                        }
                        
                    }.buttonStyle(.plain)
                }
                
                Spacer()

            }//HStack
            .foregroundColor(.white)
            .padding(.leading,30)
            .padding(.trailing,30)
        }
    }
}

enum HomeTopRow:String,CaseIterable{
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"

}

enum HomeGenre:String{
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}
