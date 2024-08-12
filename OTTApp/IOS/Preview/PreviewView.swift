//
//  PreviewView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 02/08/24.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var vm: PreviewVM
    
    var playVideo:Bool
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            TrailerPlayerView(
                videURL: vm.movie.previewVideoURl,
                playVideo: .constant(playVideo))
            
            VStack{
                HStack{
                    VStack(alignment: .leading) {
                        Text(vm.movie.name).foregroundColor(vm.movie.accentColor).bold().font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.top,60)
                
                Spacer()
                HStack{
                    ForEach(0..<vm.movie.categories.count,id: \.self) { catIndex in
                        let cat = vm.movie.categories[catIndex]
                        HStack{
                            Text(cat).font(.footnote)
                            if catIndex != vm.movie.categories.count - 1{
                                Image(systemName: "circle.fill").font(.system(size: 3))
                            }
                        }
                    }
                }//HStack
                HStack{
                    Spacer()
                    SmallVerticalButton(text: "My List", isOn: true, isOnImage: "checkmark", isOffImage: "plus",color:vm.movie.accentColor) {
                        //
                    }
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        HStack{
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("Play").fontWeight(.heavy)
                        }
                        .padding(.vertical,12)
                        .padding(.horizontal,26)
                        .border(vm.movie.accentColor,width: 3)
                    }
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOn: true, isOnImage: "info.circle", isOffImage: "info.circle",color:vm.movie.accentColor) {
                        //
                    }
                    Spacer()
                }//HStack
                .padding(.vertical,14)
            }.foregroundColor(vm.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.all)
//        .padding(.bottom,40)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
