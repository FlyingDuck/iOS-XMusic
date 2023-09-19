//
//  MainView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/15.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM: MainViewModel = MainViewModel()

    var body: some View {
        ZStack {
            switch mainVM.page {
            case .HomePage:
                HomeView()
            case .ArticPage:
                ArticView()
            case .ProfilePage:
                ProfileView()
            }
            TabbarView()
                .environmentObject(mainVM)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .environmentObject(MainViewModel(page: .ArticPage))
    }
}
