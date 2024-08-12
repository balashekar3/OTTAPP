//
//  GlobalHelpers.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 10/07/24.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.taxmann.com/emailer/images/CompaniesAct.mp4")!
let exampleVideoImageURL = URL(string: "https://picsum.photos/300/104")!

let exampleMovieTrailer1 = Trailer(name: "Big Buck Bunny",
                                   videoURL: URL(string: "https://www.taxmann.com/emailer/images/CompaniesAct.mp4")!,
                                   thumbnailImageURL: URL(string: "https://picsum.photos/200/300")!)
let exampleMovieTrailer2 = Trailer(name: "Elephant Dream",
                                   videoURL: URL(string: "https://www.taxmann.com/emailer/images/FEMA.mp4")!,
                                   thumbnailImageURL: URL(string: "https://picsum.photos/200/300")!)
let exampleMovieTrailer3 = Trailer(name: "For Bigger Blazes",
                                   videoURL: URL(string: "https://www.taxmann.com/emailer/images/IBC.mp4")!,
                                   thumbnailImageURL: URL(string: "https://picsum.photos/200/300")!)
let exampleMovieTrailer4 = Trailer(name: "For Bigger Escape",
                                   videoURL: URL(string: "https://www.taxmann.com/emailer/images/GST.mp4")!,
                                   thumbnailImageURL: URL(string: "https://picsum.photos/200/300")!)
let exampleMovieTrailers = [exampleMovieTrailer1,exampleMovieTrailer2,exampleMovieTrailer3,exampleMovieTrailer4]

let exampleMovie1 = Movie(id:UUID().uuidString,
                          name: "Dark",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,
                          rating: "TV-MA",
                          numberOfSeassons: 1,
                          episods:allExampleEpisodes,
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies:  [exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6,exampleMovie7],
                          trailers: exampleMovieTrailers,
                          previewImage: "arrestedDevPreview",
                          previewVideoURl: exampleVideoURL,
                          accentColor: Color.blue)
let exampleMovie2 = Movie(id:UUID().uuidString,
                          name: "Traveler",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,rating: "TV-MA",
                          numberOfSeassons: 1,
                          promotionHeadline: "Most wached show",
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "darkPreview",
                          previewVideoURl: exampleVideoURL)
let exampleMovie3 = Movie(id:UUID().uuidString,
                          name: "Community",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,
                          rating: "TV-MA",
                          numberOfSeassons: 1,
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "dirtyJohnPreview",
                          previewVideoURl: exampleVideoURL)
let exampleMovie4 = Movie(id:UUID().uuidString,name: "Alone",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,rating: "TV-MA",
                          numberOfSeassons: 1,
                          promotionHeadline: "New episods coming soon",
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "dirtyJohnPreview",
                          previewVideoURl: exampleVideoURL)
let exampleMovie5 = Movie(id:UUID().uuidString,
                          name: "Hannibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,
                          rating: "TV-MA",
                          numberOfSeassons: 1,
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "arrestedDevPreview",
                          previewVideoURl: exampleVideoURL)
let exampleMovie6 = Movie(id:UUID().uuidString,
                          name: "After life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,
                          rating: "TV-MA",
                          numberOfSeassons: 1,
                          promotionHeadline: "Watch Season 3 Now",
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "darkPreview",
                          previewVideoURl: exampleVideoURL)
let exampleMovie7 = Movie(id:UUID().uuidString,
                          name: "After life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Distopian","Exciting","Suspanceful","Sci-Fi TV"],
                          year: 2024,
                          rating: "TV-MA",
                          numberOfSeassons: 1,
                          promotionHeadline: "Watch Season 3 Now",
                          defaultCurrentEpisodeInfo: exampleEpisodeInfo1,
                          creator: "gurmeet singh, Mihir Desai, Karan Anshuman",
                          cast: "Ali Fazal, Vikrant Massey, Pankaj Tripathi",
                          moreLikeThisMovies: [],
                          trailers: exampleMovieTrailers,
                          previewImage: "dirtyJohnPreview",
                          previewVideoURl: exampleVideoURL)

var exampleMovies : [Movie] {
  return  [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6]
}

let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Mirzapur",
                                             decription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                                             season: 1,
                                             episode: 1)
let episode1 = Episods(name: "Episods1",
                       season: 1,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/200/304",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 53,
                       videoURL:exampleVideoURL)
let episode2 = Episods(name: "Episods2",
                       season: 1,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/200/303",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 40,
                       videoURL:exampleVideoURL)
let episode3 = Episods(name: "Episods3",
                       season: 1,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/200/308",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 30,
                       videoURL:exampleVideoURL)
let episode4 = Episods(name: "Episods1",
                       season: 2,
                       episodeNumber: 1,
                       thumbnailImageURLString: "https://picsum.photos/200/309",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 53,
                       videoURL:exampleVideoURL)
let episode5 = Episods(name: "Episods2",
                       season: 2,
                       episodeNumber: 2,
                       thumbnailImageURLString: "https://picsum.photos/200/307",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 40,
                       videoURL:exampleVideoURL)
let episode6 = Episods(name: "Episods3",
                       season: 2,
                       episodeNumber: 3,
                       thumbnailImageURLString: "https://picsum.photos/200/305",
                       discription: "The iron-fisted Akhandanand Tripathi is a millionaire carpet exporter and the mafia don of Mirzapur. His son, Munna, is an unworthy, power hungry heir who will stop at nothing to inherit his father’s legacy. An incident at a wedding procession forces him to cross paths with Ramakant Pandit, an upstanding lawyer, and his sons, Guddu and Bablu.",
                       length: 30,
                       videoURL:exampleVideoURL)
var allExampleEpisodes = [episode1,episode2,episode3,episode4,episode5,episode6]

extension LinearGradient {
    
    static let blackOpGrad =  LinearGradient(
        gradient:Gradient(
            colors: [Color.black.opacity(0.0),Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom)
    
}
extension String{
    func widthOfString(font:UIFont)->CGFloat{
        let fontAttri = [NSAttributedString.Key.font:font]
        let size = self.size(withAttributes: fontAttri)
        return size.width
    }
}

extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
