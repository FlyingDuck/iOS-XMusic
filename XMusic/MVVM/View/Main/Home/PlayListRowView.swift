//
//  PlayListRow.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/16.
//

import SwiftUI

struct PlayListRowView: View {
    
    var song : SongMode
    
    init(song: SongMode) {
        self.song = song
    }
    
    var body: some View {
        HStack(spacing: 20) {
            PlayButton()
            VStack(alignment: .leading, spacing: 0) {
                Text(song.name).font(.system(size: 16, weight: .light, design: .none)).lineLimit(1)
                Text(song.singer).font(.system(size: 14, weight: .ultraLight, design: .none))
            }
            Spacer()
            HStack(spacing: 40) {
                Text(song.formatPlayDur()).font(.system(size: 16, weight: .regular, design: .rounded))
                LikeButton()
            }
        }
    }
}

struct PlayListRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayListRowView(song: SongMode(id : "1", name: "As It Was", singer: "Harry Styles", playDur: 560, cover: "album-1"))
    }
}
