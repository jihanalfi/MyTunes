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
                    .padding([.leading, .trailing], 10)
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
            }
            .padding([.top, .bottom], 5)
        }
        .buttonStyle(PlainButtonStyle())
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
