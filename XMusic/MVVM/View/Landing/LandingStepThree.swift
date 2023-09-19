//
//  LandingStepThree.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

struct LandingStepThree: View {
    @EnvironmentObject var landingVM : LandingViewModel
    
    var body: some View {
        ZStack {
            Color("xgray-bg")
                .ignoresSafeArea()
            
            Image("landing-3")
                .position(x: UIScreen.main.bounds.width/4, y: UIScreen.main.bounds.height/1.3)
        
            VStack(alignment: .center, spacing: 20) {
                Image("Logo_text")
                
                Text("Enjoy listening to music")
                    .foregroundColor(Color("xblack-dark"))
                    .font(.system(size: 32, weight: .light, design: .rounded))
                
                Text("Spotify is a proprietary Swedish audio streaming and media services provider ")
                    .foregroundColor(Color("xblack-light"))
                    .padding(.horizontal, 30)
                
                HStack(spacing: 30) {
                    LandingButton(buttonTxt: "Register") {
                        landingVM.gotoSignUpStep()
                    }
                
                    LandingButton(backgroudColoe: Color.clear, buttonTxt: "Sign in") {
                        landingVM.gotoSignInStep()
                    }
                }
                .padding(.horizontal, 50)
            }
        }
    }
}

struct LandingStepThree_Previews: PreviewProvider {
    static var previews: some View {
        LandingStepThree()
            .environmentObject(LandingViewModel())
    }
}
