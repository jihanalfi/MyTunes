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
    @Published var currentIndex: Int = 0
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
        print("now playing: \(song.title) - \(song.artist)")

        do {
            self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            player?.play()
            isPlaying = true
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }

    private func pauseSong() {
        player?.pause()
        isPlaying = false
    }
    
    func playBefore() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        playCurrentSong()
    }

    func playAfter() {
        guard currentIndex < songList.count - 1 else { return }
        currentIndex += 1
        playCurrentSong()
    }

    private func playCurrentSong() {
        let selectedSong = songList[currentIndex]
        playSong(song: selectedSong)
    }
}


