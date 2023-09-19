//
//  PlayViewModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

class PlayViewModel: ObservableObject {
    static let shared = PlayViewModel()
    
    @Published var curSong: SongMode
    @Published var showLyrics: Bool

    init(curSong: SongMode = .init(), showLyrics: Bool = false) {
        self.curSong = curSong
        self.showLyrics = showLyrics
    }
}

extension PlayViewModel {
    func playing(song: SongMode) {
        self.curSong = song
    }

    func getPlayingSong() -> SongMode {
        return self.curSong
    }

    func toLyricsMode() {
        self.showLyrics = true
//        withAnimation(.spring(response: 2, dampingFraction: 3, blendDuration: 4)) {
//            self.showLyrics = true
//        }
    }

    func exitLyricMode() {
        self.showLyrics = false
//        withAnimation(.spring(response: 2, dampingFraction: 3, blendDuration: 4)) {
//            self.showLyrics = false
//        }
    }

    func isLyricsMode() -> Bool {
        return self.showLyrics
    }
}
