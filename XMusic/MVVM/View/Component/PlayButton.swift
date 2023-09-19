//
//  PlayButton.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/16.
//

import SwiftUI

struct PlayButton: View {
    var body: some View {
        Image(systemName: "play.circle.fill")
            .font(.system(size: 22, weight: .light, design: .rounded))
            .foregroundColor(Color.gray)
//            .background(Color.white)
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.xgrayBg
            PlayButton()
        }
    }
}
