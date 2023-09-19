//
//  PlayHome.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

struct PlayHome: View {
    @EnvironmentObject var playVM: PlayViewModel
    

    var body: some View {
        NavigationView {
            if playVM.showLyrics {
                LyricsView()
            } else {
                PlayView()
            }
        }
    }
}

struct PlayHome_Previews: PreviewProvider {
    static var previews: some View {
        PlayHome()
            .environmentObject(PlayViewModel(curSong: SongMode(id: "1", name: "YY K KDKDK KSLDJFODJOF KDJFKDJF XXX", singer: "YY UUHj", playDur: 568, cover: "album-1")))
    }
}
