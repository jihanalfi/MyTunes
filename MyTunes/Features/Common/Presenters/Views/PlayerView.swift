//
//  PlayerView.swift
//  MyTunes
//
//  Created by Jihan Alfiyyah Munajat on 19/01/24.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
//    var song: Song

    var body: some View {
        HStack{
            Button(action: {viewModel.playBefore()}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel())
}
