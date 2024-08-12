//
//  PreviewList.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI

struct PreviewList: View {
    
    var movies:[Movie]
    
    @Binding var currentSelection:Int
    @Binding var isVisible:Bool
    @State private var currentTranslation:CGFloat = 0
    let externalDrag : _EndedGesture<_ChangedGesture<DragGesture>>
    
    let screen = UIScreen.main.bounds
    
    func shouldPlayVideo(index:Int)->Bool{
        if !isVisible{
            return false
        }
        if index != currentSelection{
            return false
        }
        return true 
    }
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            PagerView(
                pageCount: movies.count,
                currentIndex: $currentSelection,
                translation: $currentTranslation,
                externalDrag: externalDrag)
            {
                ForEach(0..<movies.count,id: \.self) { movieIndex in
                    let movie = movies[movieIndex]
                    
                    PreviewView(
                        vm: PreviewVM(movie: movie),
                        playVideo: shouldPlayVideo(index: movieIndex)
                    ).frame(width: screen.width)
                }
            }
            .frame(width: screen.width)
        }
    }
}
//struct ExamplePreviewList:View{
//    @State var currentSelection:Int = 0
//    @State var isVisible:Bool = true
//    
//    var body: some View{
//        PreviewList(
//            movies: exampleMovies,
//            currentSelection: $currentSelection,
//            isVisible: $isVisible, externalDrag: externalDrag)
//    }
//}
//struct PreviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamplePreviewList()
//    }
//}
