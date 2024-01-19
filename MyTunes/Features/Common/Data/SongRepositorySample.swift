//
//  SongRepositorySample.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import Foundation

class SongRepositorySample{
    var songLists: [Song] = []
    
    init(){
        let s1 = Song(title: "Dancing Queen", artist: "ABBA", album: "Arrival", pathFile: "ABBA - Dancing Queen", pathImage: "Cover/ABBA")
        let s2 = Song(title: "How Deep Is Your Love", artist: "Bee Gees", album: "How Deep Is Your Love", pathFile: "ABBA - Dancing Queen", pathImage: "Cover/BeeGees")
        let s3 = Song(title: "Bohemian Rhapsody", artist: "Queen", album: "A Night at the Opera", pathFile: "Queen - Bohemian Rhapsody", pathImage: "Cover/Queen")
        let s4 = Song(title: "Break My Stride", artist: "Matthew Wilder", album: "I Don't Speak the Language", pathFile: "Matthew Wilder - Break My Stride", pathImage: "Cover/MatthewWilder")
        let s5 = Song(title: "Alone Again, Naturally", artist: "Gilbert O' Sullivan", album: "Himself", pathFile: "Gilbert O Sullivan - Alone Again Naturally", pathImage: "Cover/GilbertOSullivan")
        let s6 = Song(title: "My Way", artist: "Frank Sinatra", album: "My Way", pathFile: "Frank Sinatra - My Way", pathImage: "Cover/FrankSinatra")
        let s7 = Song(title: "I Just Calles To Say I Love You", artist: "Stevie Wonder", album: "I Just Calles To Say I Love You", pathFile: "Stevie Wonder - I Just Called To Say I Love You", pathImage: "Cover/StevieWonder")
        
    }
}
