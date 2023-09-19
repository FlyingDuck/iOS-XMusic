//
//  PlayVideModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

class SongViewModel: ObservableObject {}

extension SongViewModel {
    func listHomeSong() -> [SongMode] {
        return [
            SongMode(id: "1", name: "As It Was", singer: "Harry Styles", playDur: 567, cover: "album-1"),
            SongMode(id: "2", name: "God Did", singer: "DJ Khaled", playDur: 487, cover: "album-2"),
            SongMode(id: "3", name: "God Did", singer: "DJ Khaled", playDur: 485, cover: "album-3"),
            SongMode(id: "4", name: "God Did", singer: "DJ Khaled", playDur: 489, cover: "album-3"),
            SongMode(id: "5", name: "As It Was", singer: "Harry Styles", playDur: 511, cover: "album-2"),
            SongMode(id: "6", name: "As It Was", singer: "Harry Styles", playDur: 497, cover: "album-1"),
            SongMode(id: "7", name: "As It Was", singer: "Harry Styles", playDur: 505, cover: "album-3"),
            SongMode(id: "8", name: "As It Was", singer: "Harry Styles", playDur: 507, cover: "album-2"),
            SongMode(id: "9", name: "As It Was", singer: "Harry Styles", playDur: 399, cover: "album-3"),
            SongMode(id: "10", name: "As It Was", singer: "Harry Styles", playDur: 510, cover: "album-2"),
            SongMode(id: "11", name: "God Did", singer: "DJ Khaled", playDur: 364, cover: "album-1"),
            SongMode(id: "12", name: "God Did", singer: "DJ Khaled", playDur: 366, cover: "album-3"),
            SongMode(id: "13", name: "God Did", singer: "DJ Khaled", playDur: 383, cover: "album-2"),
            SongMode(id: "14", name: "As It Was", singer: "Harry Styles", playDur: 471, cover: "album-1"),
            SongMode(id: "15", name: "As It Was", singer: "Harry Styles", playDur: 492, cover: "album-2"),
        ]
    }
}
