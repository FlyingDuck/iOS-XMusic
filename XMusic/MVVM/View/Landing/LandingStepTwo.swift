//
//  LandingStepTwo.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

struct LandingStepTwo: View {
    @EnvironmentObject var landingVM: LandingViewModel
    @State var showImage: Bool = false

    var body: some View {
        ZStack {
            Color("xgray-bg")
                .ignoresSafeArea()

            if showImage {
                Image("landing-2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .transition(.scale(scale: 0.5, anchor: .center))
            }
            
            VStack(spacing: 20) {
                Image("Logo_text")
                    .padding(.top, 20)
                Spacer()

                LandingButton(buttonTxt: "Continue") {
                    landingVM.nextStep()
                }
                .padding(.horizontal, 5)
            }
            .padding(.bottom, 80)
            .padding(.all, 24)
        }
        .onAppear {
            withAnimation(.spring()) {
                showImage = true
            }
        }
    }
}

struct LandingStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        LandingStepTwo()
            .environmentObject(LandingViewModel())
    }
}
