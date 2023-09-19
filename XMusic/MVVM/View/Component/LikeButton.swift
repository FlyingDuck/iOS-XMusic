//
//  LikeButton.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/17.
//

import SwiftUI

struct LikeButton: View {
    @State var liked: Bool = false

    var body: some View {
        Group {
            if liked {
                Image("Heart_fill")
                    .renderingMode(.template)
                    .foregroundColor(Color.red)
            } else {
                Image("Heart")
            }
        }.onTapGesture {
            withAnimation(.spring()) {
                liked.toggle()
            }
        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton()
//            .background(Color.black)
    }
}
