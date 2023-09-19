//
//  AlbumViewModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/16.
//

import SwiftUI

class AlbumViewModel: ObservableObject {}

extension AlbumViewModel {
    func listHomeAlbum() -> [AlbumModel] {
        return [
            AlbumModel(id: "1", cover: "album-1", singer: "Billie Eilish", song: "Bad Guy"),
            AlbumModel(id: "2", cover: "album-2", singer: "Drake", song: "Scorpion"),
            AlbumModel(id: "3", cover: "album-3", singer: "Billie Eilish", song: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?"),
            AlbumModel(id: "4", cover: "album-2", singer: "Drake", song: "Scorpion"),
            AlbumModel(id: "5", cover: "album-3", singer: "Billie Eilish", song: "WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?"),
            AlbumModel(id: "6", cover: "album-1", singer: "Billie Eilish", song: "Bad Guy"),
        ]
    }
}
