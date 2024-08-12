//
//  Movie.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 10/07/24.
//

import Foundation
import SwiftUI

struct Movie:Identifiable{
    var id:String = UUID().uuidString
    var name:String
    var thumbnailURL:URL
    var categories:[String]
    
    //MovieDetails
    var year:Int
    var rating:String
    var numberOfSeassons:Int?
    var episods:[Episods]?
    var movieType:MovieType{
        return episods == nil ? .movie : .tvShow
    }
    var genre:HomeGenre = .AllGenres
    var promotionHeadline:String?
    var currentEpisode:CurrentEpisodeInfo?
    var defaultCurrentEpisodeInfo:CurrentEpisodeInfo
    var creator:String
    var cast:String
    var moreLikeThisMovies:[Movie]
    var trailers:[Trailer]
    var previewImage:String
    var previewVideoURl:URL?
    var accentColor:Color = .white

    var numberOfSeassonsDisplay:String{
        if let num = numberOfSeassons{
            if num == 1{
                return "1 Seassons"
            }else{
                return "\(num) Seassons"
            }
        }
        return "nil"
    }
    
    var episodeInfoDisplay:String{
        if let current = currentEpisode{
            return "Season \(current.season) : Episode \(current.episode) \(current.episodeName)"
        }else{
            return "Season \(defaultCurrentEpisodeInfo.season) : Episode \(defaultCurrentEpisodeInfo.episode) \(defaultCurrentEpisodeInfo.episodeName)"
        }
    }
    var episodeDecriptionDisplay:String{
        if let current = currentEpisode{
            return current.decription
        }else{
            return defaultCurrentEpisodeInfo.decription
        }
    }
}

struct CurrentEpisodeInfo:Hashable,Equatable{
    var episodeName:String
    var decription:String
    var season:Int
    var episode:Int
    
}
enum MovieType{
    case movie
    case tvShow
}
