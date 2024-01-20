//
//  PageView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct PageView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    @State var searchText: String = ""
    @State var songList = SongRepositorySample.getSongs()
    @State var isPlayerViewVisible = false

    var body: some View {
        NavigationView{
            VStack{
                List(songList, id: \.title){ song in
                    SongView(viewModel: viewModel, song: song)
                }
                if isPlayerViewVisible {
                    PlayerView(viewModel: viewModel, song: viewModel.currentSong)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
            }
            .navigationTitle(Text("Your Songs"))

        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            if !searchText.isEmpty{
                songList = SongRepositorySample.getSongs().filter{ $0.title.localizedCaseInsensitiveContains(searchText) ||
                    $0.album.localizedCaseInsensitiveContains(searchText) ||
                    $0.artist.localizedCaseInsensitiveContains(searchText)
                }
            } else {
                songList = SongRepositorySample.getSongs()
            }
        }
        .onChange(of: viewModel.isPlaying) { isPlaying in
            isPlayerViewVisible = true
        }
    }
}

#Preview {
    PageView()
}
