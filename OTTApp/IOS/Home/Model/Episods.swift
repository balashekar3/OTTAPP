//
//  Episods.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 18/07/24.
//

import Foundation
struct Episods:Identifiable{
    var id = UUID().uuidString
    
    var name:String
    var season:Int
    var episodeNumber:Int
    var thumbnailImageURLString:String
    var discription:String
    var length:Int
    var videoURL:URL
    
    var thumbnailURL:URL{
        return URL(string: thumbnailImageURLString)!
    }
}
