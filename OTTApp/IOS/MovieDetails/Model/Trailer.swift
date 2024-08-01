//
//  Trailer.swift
//  OTTApp
//
//  Created by Balashekar Vemula on 23/07/24.
//

import Foundation
struct Trailer:Identifiable,Hashable{
    var id:String = UUID().uuidString
    var name:String
    var videoURL:URL
    var thumbnailImageURL:URL
}
