//
//  SongRepositorySample.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import Foundation

class SongRepositorySample{
    
    static func getSongs() -> [Song] {
        return [
            Song(title: "Dancing Queen", artist: "ABBA", album: "Arrival", pathFile: "ABBA - Dancing Queen", pathImage: "ABBA"),
            Song(title: "How Deep Is Your Love", artist: "Bee Gees", album: "How Deep Is Your Love", pathFile: "ABBA - Dancing Queen", pathImage: "BeeGees"),
            Song(title: "Bohemian Rhapsody", artist: "Queen", album: "A Night at the Opera", pathFile: "Queen - Bohemian Rhapsody", pathImage: "Queen"),
            Song(title: "Break My Stride", artist: "Matthew Wilder", album: "I Don't Speak the Language", pathFile: "Matthew Wilder - Break My Stride", pathImage: "MatthewWilder"),
            Song(title: "Alone Again, Naturally", artist: "Gilbert O' Sullivan", album: "Himself", pathFile: "Gilbert O Sullivan - Alone Again Naturally", pathImage: "GilbertOSullivan"),
            Song(title: "My Way", artist: "Frank Sinatra", album: "My Way", pathFile: "Frank Sinatra - My Way", pathImage: "FrankSinatra"),
            Song(title: "I Just Calles To Say I Love You", artist: "Stevie Wonder", album: "I Just Calles To Say I Love You", pathFile: "Stevie Wonder - I Just Called To Say I Love You", pathImage: "StevieWonder")

        ]
        
    }
}
