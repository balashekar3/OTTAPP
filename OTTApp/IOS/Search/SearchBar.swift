//
//  SearchBar.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 31/07/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding  var text:String
    @State private var isEditing = true
    @Binding  var isLoading:Bool
    @State private var animationAmount = 1.0

    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 300,height: 36)
                .cornerRadius(8)
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading,10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading,-7)
                    .background(Color.graySearchBackground)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default,value:animationAmount)
                if !text.isEmpty{
                    if isLoading{
                        Button {
                            text = ""
                        } label: {
                            ActivityIndicator(isAnimating: .constant(true))
                                .foregroundColor(.white)
                        }
                        .padding(.trailing,32)
                        .frame(width: 35,height: 35)
                        
                        
                    }else{
                        Button {
                            text = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText).frame(width: 35,height: 35)
                        }.padding(.trailing,10)
                    }
                }
                
                if isEditing{
                    Button {
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("Cancle").foregroundColor(.white)
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.default,value:animationAmount)
                }
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false)).padding()
        }
    }
}
