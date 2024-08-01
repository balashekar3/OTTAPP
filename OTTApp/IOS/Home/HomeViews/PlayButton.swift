//
//  WhiteBGButton.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 13/07/24.
//

import SwiftUI

struct PlayButton: View {
    var text:String
    var imageName:String
    var backgroundColor:Color = Color.white
    var action:()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                Spacer()
                Image(systemName: imageName).font(.headline)
                Text(text).bold().font(.system(size: 16))
                Spacer()
                
            }
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .padding(.vertical,6)
            .background(backgroundColor)
            .cornerRadius(3.0)
        }

    }
}

struct WhiteBGButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            PlayButton(text: "Play", imageName: "play.fill"){
                
            }
        }
    }
}
