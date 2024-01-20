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
    
    @Published var currentTime: Double = 0.0
    @Published var playerDuration: Double = 180.0

    var player: AVAudioPlayer!
    private var cancellables: Set<AnyCancellable> = []

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
            currentIndex = songList.firstIndex(of: song) ?? 0
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
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            currentIndex = songList.count - 1
        }
        playSong(song: songList[currentIndex])
    }

    func playAfter() {
        print("clicked play after")
        if (currentIndex < songList.count - 1){
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        playSong(song: songList[currentIndex])
    }
    
    func seek(to position: Double) {
        player?.currentTime = position
        currentTime = position
        updatePlaybackInfo()
    }
    
    private func updatePlaybackInfo() {
        currentTime = player?.currentTime ?? 0.0
        playerDuration = player?.duration ?? 0.0
    }
}


