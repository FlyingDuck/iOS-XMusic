//
//  SignUpView.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/13.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var landingVM: LandingViewModel
    
    var body: some View {
        ZStack {
            Color.xgrayBg.ignoresSafeArea()
            
            VStack {
                Image("Logo_text")
                Spacer()
                
                VStack(spacing: 15) {
                    Text("Register")
                        .font(.system(size: 40, weight: .light, design: .rounded))
                    
                    HStack {
                        Text("If you need any support")
                            .foregroundColor(Color.xblackDark)
                        Text("Click Here")
                            .foregroundColor(Color.accentColor)
                    }
            
                    inputTextFields
                
                    LandingButton(buttonTxt: "Creat Account") {
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
                    Text("Do you have an account?")
                    Text("sign In")
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            landingVM.gotoSignInStep()
                        }
                        
                }
            }
            .font(.system(size: 15, weight: .light, design: .rounded))
            .padding(.horizontal, 24)
        }
    }
    
    @ViewBuilder
    var inputTextFields: some View {
        InputTextField(placeholder: "Full name", passwordMode: false)
        InputTextField(placeholder: "Enter email", passwordMode: false)
        InputTextField(placeholder: "Password", passwordMode: true)
       
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
