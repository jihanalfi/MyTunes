//
//  PlayerViewModel.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import Foundation
import AVKit
import Combine

class PlayerViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var currentSong: Song?
    @Published var songList = SongRepositorySample.getSongs()
    @Published var searchText = ""

    var player: AVAudioPlayer!
    private var cancellables: Set<AnyCancellable> = []
    
    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songList
        } else {
            return songList.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.artist.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func playPauseSong(song: Song) {
        if isPlaying {
            pauseSong()
        } else {
            playSong(song: song)
        }
    }

    private func playSong(song: Song) {
        guard let url = Bundle.main.path(forResource: song.pathFile, ofType: "mp3") else { return }
        print("Now playing: \(song.title) - \(song.artist)")

        do {
            self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            player?.play()
            isPlaying = true
            currentIndex = filteredSongs.firstIndex(of: song) ?? 0
            currentSong = song
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    func pauseSong() {
        player?.pause()
        isPlaying = false
    }
    
    func playBefore() {
        print("clicked play before")
//        guard currentIndex > 0 else { return }
//        currentIndex -= 1
        
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            currentIndex = songList.count - 1
        }
        playCurrentSong()
    }

    func playAfter() {
        print("clicked play after")
//        guard currentIndex < songList.count - 1 else { return }
        if (currentIndex < songList.count - 1){
            currentIndex += 1
        } else {
            currentIndex = 0
        }
//        currentIndex += 1
        playCurrentSong()
    }

    func playCurrentSong() {
        let selectedSong = songList[currentIndex]
        playSong(song: selectedSong)
    }
}


