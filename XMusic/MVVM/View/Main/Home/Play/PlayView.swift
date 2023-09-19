//
//  PlayView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var playVM: PlayViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 15) {
            songInfo
            playProgress

            Spacer()

            playController

            Spacer()

            lyrics
        }
//            .overlay(alignment: .center, content: {
//                if showLyrics {
//                    Text("来了老弟").font(.system(size: 100, weight: .heavy, design: .rounded))
//                }
//            })
        .padding(.horizontal, 20)
//            .navigationTitle("Now Palying")
//            .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("Up").rotationEffect(Angle(degrees: 180))
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
            }
            ToolbarItem(placement: .principal) {
                Text("Now Playing")
                    .font(.system(size: 20, weight: .regular, design: .rounded))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis").rotationEffect(Angle(degrees: 90))
            }
        }
        .background(Color.xgrayBg)
    }

    @ViewBuilder
    var songInfo: some View {
        let playingSong = playVM.getPlayingSong()

        Image(playingSong.cover)
            .resizable()
            .scaledToFill()
            .frame(height: 380, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .matchedGeometryEffect(id: "playInfoCover", in: playInfoAnimation)

        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(playingSong.name).font(.system(size: 16, weight: .light, design: .none)).lineLimit(1)
                Text(playingSong.singer).font(.system(size: 16, weight: .ultraLight, design: .none))
            }
            Spacer()
            LikeButton()
        }.padding(.horizontal)
    }

    var playProgress: some View {
        VStack {
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(height: 3, alignment: .center)
                Circle()
                    .frame(height: 12, alignment: .center)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(height: 2, alignment: .center)
                    .foregroundColor(Color.gray)
            }

            HStack {
                Text("2:25")
                Spacer()
                Text("4:50")
            }
            .padding(.horizontal, 5)
        }
        .padding(.top, 30)
    }

    var playController: some View {
        HStack(spacing: 25) {
            Image("Repeate")
            Image("Previous")
            Image("Pause")
                //                    .resizable()
                .renderingMode(.template)
                .padding()
                .foregroundColor(Color.white)
                .background(Color.accentColor)
                .clipShape(Circle())
            Image("Next")
            Image("Shuffle")
        }
    }

    @ViewBuilder
    var lyrics: some View {
        let dragGesture = DragGesture(minimumDistance: 2, coordinateSpace: .global)
            .onChanged { val in
                if val.translation.height < -100 {
                    withAnimation(.spring()) {
                        playVM.toLyricsMode()
                    }
                }
            }
            .onEnded { _ in
            }

        VStack(spacing: 0) {
            Image("Up")
            Text("Lyrics")
                .font(.system(size: 14, weight: .light, design: .none))
                .foregroundColor(Color.gray)
                .gesture(dragGesture)
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlayView()
                .environmentObject(PlayViewModel(curSong: SongMode(id: "1", name: "YY K KDKDK KSLDJFODJOF KDJFKDJF XXX", singer: "YY UUHj", playDur: 568, cover: "album-1")))
        }
    }
}
