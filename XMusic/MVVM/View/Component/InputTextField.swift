//
//  InputTextField.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/13.
//

import SwiftUI

struct InputTextField: View {
    var placeholder: String
    var passwordMode: Bool

    init(placeholder: String = "this is placeholder", passwordMode: Bool = false) {
        self.placeholder = placeholder
        self.passwordMode = passwordMode
    }

    var body: some View {
        HStack {
            TextField(placeholder, text: .constant(""))

            if passwordMode {
                Image(systemName: "eye.slash").foregroundColor(Color.gray.opacity(0.5))
            }
        }
        .font(.system(size: 20, weight: .light, design: .rounded))
        .foregroundColor(Color.xgray)
        .padding(.all)
        .padding(.vertical, 15)
        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .center)
        .background(.clear)
        .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
        .overlay(alignment: .center) {
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.xblackLight.opacity(0.3))
        }
    }
}

struct InputTextField_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(passwordMode: true)
    }
}
