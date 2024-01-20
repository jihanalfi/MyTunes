//
//  SongView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct SongView: View {
    @ObservedObject var viewModel: PlayerViewModel
    var song: Song
  
    var body: some View {
        Button(action: {
            viewModel.playPauseSong(song: song)
        }){
            HStack{
                Image("\(song.pathImage)")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding()
                VStack(alignment: .leading){
                    Text("\(song.title)")
                        .bold()
                        .lineLimit(1)
                        .fixedClipped()
                    Text("\(song.artist)")
                    Text("\(song.album)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
//        .onTapGesture {
//            viewModel.playPauseSong(song: song)
//        }
    }
}

struct FixedClipped: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content.hidden().layoutPriority(1)
            content.fixedSize(horizontal: true, vertical: false)
        }
        .clipped()
    }
}

extension View {
    func fixedClipped() -> some View {
        self.modifier(FixedClipped())
    }
}
