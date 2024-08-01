//
//  HomeVM.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 10/07/24.
//

import Foundation
class HomeVM: ObservableObject{
     
    @Published var movies : [String:[Movie]] = [:]
    
    public var allCatageries:[String]{
         movies.keys.map({ String($0) })
    }
    public var allGenre:[HomeGenre] = [.AllGenres,.Action,.Comedy,.Horror,.Thriller]
    
    public func getMovie(forCat cat:String, homeRow:HomeTopRow,genre:HomeGenre)->[Movie]{
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .tvShows:
            return (movies[cat] ?? []).filter({($0.movieType == .tvShow) && ($0.genre == genre)})
        case .movies:
            return (movies[cat] ?? []).filter({($0.movieType == .movie) && ($0.genre == genre)})
        case .myList:
            return movies[cat] ?? []

        }
    }
    init(){
        setupMovies()
    }
    
    func setupMovies(){
        movies["Watchlist"] = exampleMovies.shuffled()
        movies["Trending"] = exampleMovies
        movies["Standup"] = exampleMovies.shuffled()
    }
}
