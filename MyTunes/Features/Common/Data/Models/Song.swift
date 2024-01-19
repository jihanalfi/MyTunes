//
//  Song.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import Foundation

struct Song: Codable{
    var title: String
    var artist: String
    var album: String
    var pathFile: String
    var pathImage: String
    
    init(title: String, artist: String, album: String, pathFile: String, pathImage: String){
        self.title = title
        self.artist = artist
        self.album = album
        self.pathFile = pathFile
        self.pathImage = pathImage
    }
}
