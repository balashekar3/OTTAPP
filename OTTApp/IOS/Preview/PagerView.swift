//
//  PagerView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI

struct PagerView<Content:View>: View {
    let pageCount:Int
    @Binding var currentIndex:Int
    @Binding var translation:CGFloat
    @State private var verticalDragIsActive:Bool = false
    let externalDrag : _EndedGesture<_ChangedGesture<DragGesture>>
    let content:Content
    
    init(
        pageCount:Int,
        currentIndex:Binding<Int>,
        translation:Binding<CGFloat>,
        externalDrag:_EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content:()->Content
    ){
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDrag = externalDrag
        self.content = content()
    }
    var body: some View {
        GeometryReader{ geo in
            HStack(spacing: 0){
                self.content.frame(width: geo.size.width)
                
            }
            .frame(width: geo.size.width,alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x:self.translation)
            .animation(.interactiveSpring(), value: 1.0)
            .gesture(
                externalDrag.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                        .onChanged({ value in
                            if verticalDragIsActive{
                                return
                            }
                            if abs(value.translation.width) < abs(value.translation.height){
                                verticalDragIsActive = true
                                return
                            }
                            //horizontaldrag
                            
                            translation = value.translation.width
                        })
                        .onEnded({ value in
                            if verticalDragIsActive{
                                verticalDragIsActive = false
                                return
                            }
                            //ending horizontal drag
                            let offset = value.translation.width / geo.size.width
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIndex), 0) , self.pageCount - 1)
                            translation = 0
                        })
                    
                    
                )
            )
        }
    }
}
//struct PageDammy:View{
//    @State private var currentIndex:Int = 0
//    @State private var translation:CGFloat = .zero
//    
//    var body: some View {
//        PagerView(pageCount: 6, currentIndex: $currentIndex, translation:$translation, content: {
//            Color.red
//            Color.blue
//            Color.green
//            Color.orange
//            Color.pink
//            Color.cyan
//        })
//    }
//    
//}
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageDammy()
//    }
//}
