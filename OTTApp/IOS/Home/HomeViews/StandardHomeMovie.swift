//
//  StandardHomeMovie.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 10/07/24.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie:Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
