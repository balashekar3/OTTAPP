//
//  HomeStack.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 31/07/24.
//

import Foundation
import SwiftUI

struct HomeStack:View{
    var vm:HomeVM
    @Binding var movieDetailToShow:Movie?
    var topRowSelection:HomeTopRow
    var selectedGenre:HomeGenre

    var body:some View{
        ForEach(vm.allCatageries,id: \.self){ catogory in
            VStack {
                HStack{
                    Text(catogory)
                    Spacer()
                }
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack{
                        ForEach(vm.getMovie(forCat: catogory, homeRow: topRowSelection,genre: selectedGenre)){ movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 130,height: 200)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }//LazyHStack
                }//ScrollView
            }//VStack
            .padding(.leading,6)
        }//ForEach
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView{
                HomeStack(vm: HomeVM(), movieDetailToShow: .constant(nil), topRowSelection: .home, selectedGenre: .AllGenres)
            }.foregroundColor(.white)
        }
    }
}
