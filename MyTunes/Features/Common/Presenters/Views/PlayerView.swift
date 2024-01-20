//
//  PlayerView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    @State private var playbackPosition: Double = 0.0
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
            Slider(value: $playbackPosition, in: 0...viewModel.playerDuration,step:1)
                .padding(.horizontal, 20)
            
            HStack{
                Text("\(formattedTime(from: playbackPosition))")
                Spacer()
                Text("\(formattedTime(from: viewModel.playerDuration))")
            }
            .padding(.horizontal, 10)

        }
        .frame(width: UIScreen.main.bounds.width, height: 120)
        .background(.white)
        
        .onAppear {
            playbackPosition = viewModel.currentTime
        }
        .onChange(of: playbackPosition) { newPosition in
            viewModel.seek(to: newPosition)
        }
        .onChange(of: viewModel.currentTime) { currentTime in
            playbackPosition = currentTime
        }
    }
    
    private func formattedTime(from seconds: Double) -> String {
            let minutes = Int(seconds) / 60
            let remainingSeconds = Int(seconds) % 60
            return String(format: "%02d:%02d", minutes, remainingSeconds)
        }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel(), song: Song(title: "Dancing Queen", artist: "ABBA", album: "Arrival", pathFile: "ABBA - Dancing Queen", pathImage: "ABBA"))
}
