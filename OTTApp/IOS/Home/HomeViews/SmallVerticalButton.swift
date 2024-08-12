//
//  SmallVerticalButton.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 13/07/24.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text:String
    var isOn:Bool
    
    var isOnImage:String
    var isOffImage:String
    var color:Color = Color.white
    
    var imageName:String{
        return isOn ? isOnImage : isOffImage
    }
    var action:()->Void
    
    var body: some View {
        Button {
            //action
            action()
        } label: {
            VStack{
                Image(systemName: imageName).foregroundColor(color)
                Text(text).font(.system(size: 14)).bold().foregroundColor(color)
            }
        }

    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton(text: "My List",
                            isOn: true,
                            isOnImage: "checkmark",
                            isOffImage: "plus"){
            print("Tapped")
        }
    }
}

