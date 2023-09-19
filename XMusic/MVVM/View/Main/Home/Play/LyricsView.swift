//
//  LyricsView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

struct LyricsView: View {
    @EnvironmentObject var playVM: PlayViewModel
    
    var body: some View {
        VStack {
            songInfo
            
            playProgress
            
            playController
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("Up")
                    .renderingMode(.template)
                    .rotationEffect(Angle(degrees: 270))
                    
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                    .onTapGesture {
                        playVM.exitLyricMode()
                    }
            }
            ToolbarItem(placement: .principal) {
                Text(playVM.getPlayingSong().name)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                    .foregroundColor(Color.white)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "ellipsis")
                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(Color.white)
            }
        }
        .background(Color.xgrayBg)
    }
    
    @ViewBuilder
    var songInfo: some View {
        let playingSong = playVM.getPlayingSong()
        
        Image(playingSong.cover)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .frame(height: 5 * UIScreen.main.bounds.height / 8, alignment: .center)
            .overlay(alignment: .center) {
                Color.gray
                    .ignoresSafeArea()
                    .opacity(0.4)
            }
//            .matchedGeometryEffect(id: "playInfoCover", in: playInfoAnimation)
        HStack {
            Image(playingSong.cover)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
            
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
        }
        .padding(.horizontal)
//        .padding(.top, 30)
    }
    
    var playController: some View {
        HStack(spacing: 25) {
            Image("Repeate")
            Image("Previous")
            Image("Pause")
                .renderingMode(.template)
                .padding()
                .foregroundColor(Color.white)
                .background(Color.accentColor)
                .clipShape(Circle())
                .scaleEffect(0.8)
            Image("Next")
            Image("Shuffle")
        }
    }
}

struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LyricsView()
                .environmentObject(PlayViewModel(curSong: SongMode(id: "1", name: "YY K KDKDK KSLDJFODJOF KDJFKDJF XXX", singer: "YY UUHj", playDur: 568, cover: "album-1")))
        }
    }
}
