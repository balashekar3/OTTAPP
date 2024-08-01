//
//  SearchResultGridView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import SwiftUI

struct SearchResultGridView: View {
    var movies:[Movie]
    @Binding var movieDetailsToShow:Movie?
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        
        LazyVGrid(columns: columns,spacing: 10) {
            ForEach(0..<movies.count, id: \.self) { index in
                StandardHomeMovie(movie: movies[index])
                    .onTapGesture {
                        movieDetailsToShow = movies[index]
                    }
            }
        }
    }
}

struct SearchResultGridView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultGridView(movies: generateMovies(20),movieDetailsToShow: .constant(nil))
    }
}

