//
//  HomeView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

struct HomeView: View {
    @StateObject var albumVM: AlbumViewModel = .init()
    @StateObject var songVM: SongViewModel = .init()
    @ObservedObject var playVM : PlayViewModel = PlayViewModel.shared
    
    @State var fullScreenPlaying : Bool = false

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                banner
                albumList
                playList
            }
            .background(Color.xgrayBg)
            .toolbar {
                toolbar
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Image("Search")
//                }
//
//                ToolbarItem(placement: .principal) {
//                    Image("Logo_text")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 40, alignment: .center)
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Image(systemName: "ellipsis").rotationEffect(Angle(degrees: 90))
//                }
            }
            .fullScreenCover(isPresented: $fullScreenPlaying) {
                
            } content: {
                PlayHome().environmentObject(playVM)
                    
            }

        }
    }

    @ToolbarContentBuilder
    var toolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Image("Search")
        }

        ToolbarItem(placement: .principal) {
            Image("Logo_text")
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .padding(.vertical, 8)
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Image(systemName: "ellipsis").rotationEffect(Angle(degrees: 90))
        }
    }

    var banner: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("New Album")
                .font(.system(size: 12))
            Text("Happier Than \nEver")
                .font(.system(size: 20, weight: .regular, design: .none))
            Text("Billie Eilish")
                .font(.system(size: 15))
        }
        .padding(.vertical, 20)
        .padding(.leading, 15)
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 35, style: .continuous))
        .overlay(alignment: .bottom) {
            Image("banner-woman")
                .resizable()
                .scaledToFill()
        }
        .padding(.horizontal)
    }

    @ViewBuilder
    var albumList: some View {
        HStack(spacing: 45) {
            Text("News")
                .foregroundColor(Color.black)
                .overlay(alignment: .bottom) {
                    Capsule()
                        .frame(width: 30, height: 3, alignment: .center)
                        .foregroundColor(Color.accentColor)
                        .offset(y: 5)
                }
            Text("Video")
            Text("Artics")
            Text("Podcast")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.gray)
        .padding(.leading, 15)

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(albumVM.listHomeAlbum(), id: \.id) { album in
                    AlbumView(album: album)
                }
            }
            .padding(.leading, 15)
        }
    }

    var playList: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Playlist")
                    .font(.system(size: 24, weight: .regular, design: .none))
                Spacer()
                Text("See More")
                    .font(.system(size: 15, weight: .light, design: .none))
            }

            ForEach(songVM.listHomeSong(), id: \.id) { song in
                PlayListRowView(song: song)
                    .onTapGesture {
                        playVM.playing(song: song)
                        
                        fullScreenPlaying = true
                    }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Color.blue
            HomeView()
        }
    }
}
