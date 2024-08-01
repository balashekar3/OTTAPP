//
//  ComingSoonView.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 01/08/24.
//

import SwiftUI

struct ComingSoonView: View {
    
    @State private var showNotificationList:Bool = false
    @State private var navBarHidden = true
    @ObservedObject var vm = ComingSoonVM()
    @State private var movieDetailsToShow:Movie? = nil
    @State private var scrollOffset:CGFloat = 0.0
    
    var body: some View {
        
        Group {
            ZStack{
                Color.black.ignoresSafeArea(.all)
                TrackableScrollView(.vertical,showIndicators: false,contentOffset:$scrollOffset) {
                    LazyVStack {
                        NotificationBarVIew(showNotificationList: $showNotificationList)
                        
                        ForEach(vm.movies) { movie in
                            ComingSoonRow(movie: movie, movieDetaialsToShow: $movieDetailsToShow)
                                .frame(height: 400)
                        }//ForEach
                    }//LazyVStack
                }//TrackableScrollView
            }.foregroundColor(.white)
        }//Group
        
       /* NavigationStack{
            Group {
                ZStack{
                    Color.black.ignoresSafeArea(.all)
                    TrackableScrollView(.vertical,showIndicators: false,contentOffset:$scrollOffset) {
                        LazyVStack {
                            NotificationBarVIew(showNotificationList: $showNotificationList)
                            
                            ForEach(vm.movies) { movie in
                                ComingSoonRow(movie: movie, movieDetaialsToShow: $movieDetailsToShow)
                                    .frame(height: 400)
                            }//ForEach
                        }//LazyVStack
                    }//TrackableScrollView
                    Text("\(scrollOffset)").background(.red)
                }.foregroundColor(.white)
            }//Group
            .navigationDestination(isPresented: $showNotificationList) {
                Text("List")
            }
            .navigationTitle("")
            .navigationBarHidden(navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.navBarHidden = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.navBarHidden = false
            }
            
        }*/
        
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            ComingSoonView()
        }
    }
}
