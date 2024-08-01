//
//  DownloadsView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import SwiftUI

struct DownloadsView: View {
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack{
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON").foregroundColor(.blue)
                    Spacer()
                }
                .padding()
                .font(.system(size: 18,weight: .bold))
                ZStack{
                    Circle().foregroundColor(.graySearchBackground).padding(.horizontal,100)
                    Image(systemName: "arrow.down.to.line.alt").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75).foregroundColor(.gray)
                }
                .frame(height: 275)
                .padding(.top,50)
                VStack(spacing: 20){
                    Text("Never be with OTTApp").font(.title2).bold()
                    Text("Download shows and movies so you will never be without somthing to watch---\n-even when your in offline.").multilineTextAlignment(.center).padding(.horizontal,50)
                    
                    Button {
                        //
                    } label: {
                        Text("See what you can download").foregroundColor(.black).padding().bold()
                            .background(Color.white)
                    }
                    .cornerRadius(5.0)
                }
                
                
                
                Spacer()
            }.foregroundColor(.white)
        }
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            DownloadsView()
        }
    }
}
