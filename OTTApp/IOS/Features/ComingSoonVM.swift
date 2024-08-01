//
//  ComingSoonVM.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import Foundation
class ComingSoonVM:ObservableObject{
    @Published var movies:[Movie] = []
    
    init(){
        self.movies = generateMovies(20)
    }
}
