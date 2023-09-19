//
//  LandingStepOneView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

struct LandingStepOneView: View {
    @EnvironmentObject var landingVM: LandingViewModel

    var body: some View {
        ZStack {
            Image("landing-1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Image("Logo_text")
                    .padding(.top, 20)
                Spacer()
                Text("Enjoy listening to music")
                    .foregroundColor(Color.white)
                    .font(.system(size: 32, weight: .light, design: .rounded))

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.")
                    .foregroundColor(Color("xblack-light"))

                LandingButton(buttonTxt: "Get Started") {
                    landingVM.nextStep()
                }
                .padding(.horizontal, 5)
            }
            .padding(.bottom, 80)
            .padding(.all, 24)
        }
    }
}

struct LandingStepOneView_Previews: PreviewProvider {
    static var previews: some View {
        LandingStepOneView()
            .environmentObject(LandingViewModel())
    }
}
