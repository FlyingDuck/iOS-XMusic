//
//  ShowcaseRow.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/16.
//

import SwiftUI

struct AlbumView: View {
    
    var album : AlbumModel
    
    init(album: AlbumModel) {
        self.album = album
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Image(album.cover)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay(alignment: .bottomTrailing) {
                    PlayButton().offset(x: -4, y: 3)
                }
            VStack(alignment: .leading) {
                Text(album.song).font(.system(size: 16, weight: .light, design: .none)).lineLimit(1)
                Text(album.singer).font(.system(size: 16, weight: .ultraLight, design: .none))
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: UIScreen.main.bounds.width/3)
    }
}

struct ShowcaseRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.xgrayBg
            AlbumView(album: AlbumModel(id: "1", cover: "album-2", singer: "Some Body", song: "Hello World,Hello World， Hello World， Hello World"))
        }
    }
}
