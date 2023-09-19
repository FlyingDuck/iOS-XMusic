//
//  LandingView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var landingVM: LandingViewModel

    var body: some View {
        ZStack {
            if landingVM.isFirstStep() {
                LandingStepOneView()
            } else if landingVM.isSecondStep() {
                LandingStepTwo()
            } else if landingVM.isFinalStep() {
                LandingStepThree()
            } else if landingVM.isSignInStep(){
                SignInView()
            } else if landingVM.isSignUpStep() {
                SignUpView()
            }

            VStack {
                Spacer()

                Text("\(landingVM.step)")
                    .font(.system(size: 70, weight: .light, design: .monospaced))
                    .foregroundColor(Color.red.opacity(0.5))
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(LandingViewModel(signin: false, step: 2))
    }
}
