//
//  PlayerView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    var song: Song

    var body: some View {
        HStack{
            Button(action: {viewModel.playBefore()}, label: {
                Image(systemName: "backward.end.fill")
            })
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {viewModel.playPauseSong(song: song)
            }) {
                Image(systemName: viewModel.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            Button(action: {viewModel.playAfter()}, label: {
                Image(systemName: "forward.end.fill")
            })
            .buttonStyle(PlainButtonStyle())

        }
    }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel(), song: Song(title: "Dancing Queen", artist: "ABBA", album: "Arrival", pathFile: "ABBA - Dancing Queen", pathImage: "ABBA"))
}
