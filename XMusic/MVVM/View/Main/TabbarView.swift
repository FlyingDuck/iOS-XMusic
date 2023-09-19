//
//  TabbarView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/15.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var mainVM: MainViewModel
    @Namespace var animation // todo 这是什么玩意？
    
    var body: some View {
        HStack {
            ForEach(mainVM.allPageCases(), id: \.self) { page in
                
                Image(mainVM.getIconName(page: page))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mainVM.gotoPage(page: page)
                        }
                    }
                    .overlay(alignment: .top) {
                        if mainVM.isSelectedPage(page: page) {
                            Capsule(style: .continuous)
                                .frame(width: 23, height: 3, alignment: .center)
                                .foregroundColor(Color.accentColor)
                                .offset(y: -15)
                                .matchedGeometryEffect(id: "tabbar", in: animation) // todo 这是什么玩意？
                        }
                    }
                
                if page != .ProfilePage {
                    Spacer()
                }
            }
            
//            Image("Home")
//                .onTapGesture {
//                    mainVM.gotoHomePage()
//                }
//            Spacer()
//            Image("Heart")
//                .onTapGesture {
//                    mainVM.gotoArticPage()
//                }
//            Spacer()
//            Image("Profile")
//                .onTapGesture {
//                    mainVM.gotoProfilePage()
//                }
        }
        .padding(.horizontal, 45)
        .padding(.top, 16)
        .background(Color.white)
        .frame(maxHeight: UIScreen.main.bounds.height, alignment: .bottom)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            TabbarView()
                .environmentObject(MainViewModel())
        }
    }
}
