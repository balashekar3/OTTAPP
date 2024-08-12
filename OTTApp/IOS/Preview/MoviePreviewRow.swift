//
//  MoviePreviewRow.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies:[Movie]
    @Binding var showPreviewFullScreen : Bool
    @Binding var previewStartingIndex : Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Previews").bold().font(.title2).padding(.leading,6)
            
            ScrollView(.horizontal,showsIndicators: false){
                LazyHStack{
                    ForEach(0..<movies.count,id: \.self) { movieIndex in
                        let movie = movies[movieIndex]
                        MoviePreViewCell(movie: movie)
                            .frame(width: 120,height: 120)
                            .padding(.trailing,14)
                            .padding(.leading,6)
                            .onTapGesture {
                                previewStartingIndex = movieIndex
                                showPreviewFullScreen = true
                            }
                    }
                }
                
            }
        }
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies,showPreviewFullScreen: .constant(false),previewStartingIndex: .constant(0))
        }
    }
}
