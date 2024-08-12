//
//  MainContentView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 31/07/24.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex:Int = 0
    @State private var previewCurrentPosition:CGFloat = 1000
    @State private var previewNewPosition:CGFloat = 1000

    @State private var previewHorizontalDragActive:Bool = false
    let screen = UIScreen.main.bounds
    
    
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = UIColor.black
        
    }
    var body: some View {
        let previewDrag = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if previewHorizontalDragActive{
                    return
                }
                if previewCurrentPosition == .zero{
                    if abs(value.translation.width) > abs(value.translation.height){
                        previewHorizontalDragActive = true
                        return
                    }
                }
               
                //vertical
                let shouldBePosition = value.translation.height + self.previewNewPosition
                if shouldBePosition<0{
                    return
                }else{
                    self.previewCurrentPosition = shouldBePosition
                }
                
            }
            .onEnded { value in
                if previewHorizontalDragActive{
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + self.previewNewPosition
                if shouldBePosition<0{
                    self.previewCurrentPosition = .zero
                    self.previewNewPosition = .zero
                    
                }else{
                    let closePoint = screen.size.height * 0.2
                    if shouldBePosition > closePoint{
                        withAnimation {
                            self.showPreviewFullScreen = false
                            self.previewCurrentPosition = screen.height + 20
                            self.previewNewPosition = screen.height + 20
                        }
                    }else{
                        withAnimation {
                            self.previewNewPosition = .zero
                            self.previewCurrentPosition = .zero
                        }
                    }
                }
                previewHorizontalDragActive = false
            }
      return ZStack{
            TabView{
                HomeView(showPreviewFullScreen: $showPreviewFullScreen, previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
                
            }//TabView
            .accentColor(.white)
            
            PreviewList(
                movies: exampleMovies,
                currentSelection: $previewStartingIndex,
                isVisible: $showPreviewFullScreen,
                externalDrag: previewDrag 
            )
            .offset(y:previewCurrentPosition)
            .isHidden(!showPreviewFullScreen)
            .animation(.easeIn, value: 1.0)
            .transition(.move(edge: .bottom))
            .onChange(of: showPreviewFullScreen) { value in
                if value{
                    withAnimation {
                        //show full screen
                        previewCurrentPosition = .zero
                        previewNewPosition = .zero
                    }
                }else{
                    //hiding
                    withAnimation {
                        self.previewCurrentPosition = screen.height + 20
                        self.previewNewPosition = screen.height + 20

                    }
                }
            }
        }//ZStack
    }
    
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
