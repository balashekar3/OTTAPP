//
//  NotificationBarVIew.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import SwiftUI

struct NotificationBarVIew: View {
    @Binding var showNotificationList:Bool
    
    var body: some View {
        Button {
            showNotificationList = true
        } label: {
            HStack{
                Image(systemName: "bell")
                Text("Notification").bold()
                Spacer()
                Image(systemName: "chevron.right")
            }.font(.system(size: 18,weight: .bold))
        }.foregroundColor(.white)

    }
}

struct NotificationBarVIew_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            NotificationBarVIew(showNotificationList: .constant(false))
        }
    }
}
