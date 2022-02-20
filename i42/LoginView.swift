//
//  LoginView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        CardView() {
            VStack {
                Image(colorScheme == .dark ? "logo.w" : "logo")
                    .resizable()
                    .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenWidth * 0.9, alignment: .center)
                Button(action: {  }) {
                    Text("Login with Intra").frame(width: UIScreen.screenWidth * 0.9, height: 100, alignment: .center)
                        .background(.ultraThinMaterial)
                        .background(.green)
                        .font(.title)
                        .foregroundColor(Color.secondary)
                }
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .environmentObject(Network())
        }
    }
}
