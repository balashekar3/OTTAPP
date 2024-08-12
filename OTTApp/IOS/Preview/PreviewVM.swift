//
//  PreviewVM.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import Foundation

class PreviewVM:ObservableObject{
    
    var movie:Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
