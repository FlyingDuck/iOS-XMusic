//
//  SessionViewModel.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/11.
//

import SwiftUI

class LandingViewModel: ObservableObject {
    @Published var signin: Bool = false
    @Published var step: Int = 0
    
    init(signin: Bool = false, step: Int = 0) {
        self.signin = signin
        self.step = step
    }
}

extension LandingViewModel {
    func signIn() {
        signin = true
    }
    
    func signOut() {
        signin = false
    }
    
    func nextStep() {
        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
            if step >= 3 {
                return
            }
            step += 1
        }
    }
    func gotoSignInStep() {
        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
            step = 3
        }
    }
    func gotoSignUpStep() {
        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
            step = 4
        }
    }
    
    
    func isFirstStep() -> Bool {
        return step == 0
    }
    func isSecondStep() -> Bool {
        return step == 1
    }
    func isFinalStep() -> Bool {
        return step == 2
    }
    func isSignInStep() -> Bool {
        return step == 3
    }
    func isSignUpStep() -> Bool {
        return step == 4
    }
}



