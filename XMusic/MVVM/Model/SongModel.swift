//
//  PlayModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import Foundation

struct SongMode {
    var id: String = ""
    var name: String = ""
    var singer: String = ""
    var playDur: Int = 0
    var cover: String = ""
}

extension SongMode {
    func formatPlayDur() -> String {
        return "\(playDur / 60):\(playDur % 60)"
    }
}
