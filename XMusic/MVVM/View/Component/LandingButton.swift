//
//  LandingButton.swift
//  XMusic
//
//  Created by dongshujin on 2023/9/12.
//

import SwiftUI

struct LandingButton: View {
    var buttonTxt: String = ""
    var clickAction: () -> Void
    var backgroudColor: Color

    init(backgroudColoe: Color = Color.accentColor, buttonTxt: String, clickAction: @escaping () -> Void) {
        self.buttonTxt = buttonTxt
        self.clickAction = clickAction
        self.backgroudColor = backgroudColoe
    }

    var body: some View {
        Button {
            clickAction()
        } label: {
            Text(buttonTxt)
                .foregroundColor(getTxtColor())
                .font(.system(size: 24, weight: .light, design: .rounded))
                .padding(.all)
                .padding(.vertical, 15)
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .center)
                .background(self.backgroudColor)
                .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
        }
//        .overlay(alignment: .center) {
//            ProgressView()
//        }
    }

    func getTxtColor() -> Color {
        var txtColor = Color.white
        if backgroudColor != Color.accentColor {
            txtColor = Color.black
        }
        return txtColor
    }
}

struct LandingButton_Previews: PreviewProvider {
    static var previews: some View {
        LandingButton(buttonTxt: "Button Text", clickAction: {})
            .background(Color.black)
    }
}
