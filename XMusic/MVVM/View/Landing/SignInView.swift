//
//  SignInView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/13.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var landingVM: LandingViewModel
    
    var body: some View {
        ZStack {
            Color("xgray-bg").ignoresSafeArea()
            
            VStack {
                Image("Logo_text")
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Sign In")
                        .font(.system(size: 40, weight: .light, design: .rounded))
                    
                    HStack {
                        Text("If you need any support")
                            .foregroundColor(Color.xblackDark)
                        Text("Click Here")
                            .foregroundColor(Color.accentColor)
                    }
            
                    inputTextFields
                
                    LandingButton(buttonTxt: "Sign In") {
                        landingVM.signIn()
                    }
                    
                    HStack(spacing: 20) {
                        Rectangle().fill(Color.gray.opacity(0.5)).frame(height: 0.5)
                        Text("Or").font(.system(size: 15, weight: .light, design: .rounded))
                        Rectangle().fill(Color.gray.opacity(0.5)).frame(height: 0.5)
                    }
                    
                    HStack(spacing: 50) {
                        Image(systemName: "apple.logo")
                            .font(.system(size: 32, weight: .black, design: .none))
                        Image("Google")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                    }
                }.padding(.vertical, 35)
                
                Spacer()
                HStack() {
                    Text("not a member ?")
                    Text("register now").foregroundColor(Color.blue)
                        .onTapGesture {
                            landingVM.gotoSignUpStep()
                        }
                }
            }
            .font(.system(size: 15, weight: .light, design: .rounded))
            .padding(.horizontal, 24)
        }
    }
    
    @ViewBuilder
    var inputTextFields: some View {
        InputTextField(placeholder: "enter username or email", passwordMode: false)
        InputTextField(placeholder: "Password", passwordMode: true)
        Text("Recovery password")
            .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(LandingViewModel(signin: false, step: 2))
    }
}
