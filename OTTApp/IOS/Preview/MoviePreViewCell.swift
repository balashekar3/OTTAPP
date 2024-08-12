//
//  MoviePreViewCell.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI
import Kingfisher

struct MoviePreViewCell: View {
    var movie:Movie
    let colors:[Color] = [.yellow,.red,.cyan,.orange,.green,.pink]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL).resizable().scaledToFill().clipShape(Circle())
                .overlay(
                    Circle().stroke(lineWidth: 3.0)
                        .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImage).resizable().scaledToFit()
                .frame(height: 65)
                .offset(y:-30)
        }.frame(height: 100)
    }
}

struct MoviePreViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            MoviePreViewCell(movie: exampleMovie1)
                .frame(width: 165,height: 50)
        }
    }
}
