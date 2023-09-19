//
//  ContentView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI


struct ContentView: View {
    @StateObject var landingVM: LandingViewModel = .init()

    var body: some View {
        if landingVM.signin {
            MainView()
        } else {
            LandingView().environmentObject(landingVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
