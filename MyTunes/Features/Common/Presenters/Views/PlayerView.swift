//
//  PlayerView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    var song: Song?

    var body: some View {
        VStack{
            HStack{
                Button(action: {viewModel.playBefore()}, label: {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: 20, height: 20)

                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {viewModel.playPauseSong(song: song!)
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())

                
                Button(action: {viewModel.playAfter()}, label: {
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: 20, height: 20)

                })
                .buttonStyle(PlainButtonStyle())

            }
            Text("slider")
        }
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .background(.white)
//        .frame(width: UIScreen.main.bounds.width) // or use .edgesIgnoringSafeArea(.horizontal)

//        .edgesIgnoringSafeArea(.horizontal)
    }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel(), song: Song(title: "Dancing Queen", artist: "ABBA", album: "Arrival", pathFile: "ABBA - Dancing Queen", pathImage: "ABBA"))
}
