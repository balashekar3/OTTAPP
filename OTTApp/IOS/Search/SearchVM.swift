//
//  SearchVM.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 31/07/24.
//

import Foundation
import SwiftUI

class SearchVM:ObservableObject{
    
    @Published var isLoadingSearch:Bool = false
    @Published var viewState:ViewStates = .ready
    @Published var popularMovies:[Movie] = []
    @Published var searchResults:[Movie] = []
    @Published var isShowingPopularMovies:Bool = true
    
    init(){
        getPopularMovies()
    }
    
    public func updateSearchText(text:String){
        setViewState(state: .loading)
        if text.count>0{
            isShowingPopularMovies = false
            getSearchResults(text: text)
        }else{
            isShowingPopularMovies = true
        }

    }
    private func getPopularMovies(){
        self.popularMovies = generateMovies(40)
    }
    private func getSearchResults(text:String){
        let haveResult = Int.random(in: 0...3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0{
                //epptyView
                self.searchResults = []
                self.setViewState(state: .empty)
            }else{
                //readyView
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(state: .ready)

            }
        }
    }
    private func setViewState(state:ViewStates){
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoadingSearch = state == .loading
        }
    }

}

enum ViewStates{
    case empty
    case loading
    case ready
    case error
}
