//
//  CustomTabSwitcher.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 19/07/24.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    @State private var currentTab:CustomTab = .episodes
    
    var tabs:[CustomTab]
    var movie:Movie
    
    @Binding  var showSeassonPicker:Bool
    @Binding  var selectedSeasson:Int
    
    func widthForTab(tab:CustomTab) -> CGFloat{
        let string = tab.rawValue
        return string.widthOfString(font: .systemFont(ofSize: 16, weight: .bold))
    }
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: true){
                HStack {
                    ForEach(tabs,id: \.self) { tab in
                        VStack {
                            Rectangle().frame(width: widthForTab(tab: tab),height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            Button {
                                currentTab = tab
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16,weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            }
                            .buttonStyle(.plain)
                            .frame(width: widthForTab(tab: tab), height: 30)
                        }
                    }
                }
            }
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episods ?? [], showSeassonPicker: $showSeassonPicker, selectedSeasson: $selectedSeasson)
            case .trailers:
                TrailerListView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
        }.foregroundColor(.white)
    }
}
enum CustomTab:String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
    
}
struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes,.trailers,.more], movie: exampleMovie1,showSeassonPicker: .constant(false),selectedSeasson: .constant(1))
        }
    }
}
