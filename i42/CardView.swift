//
//  CardView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI


struct CardView<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .layoutPriority(100)
        .background(.background)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .shadow(color: colorScheme == .dark ? .black : .secondary.opacity(0.5),radius: 5, y: 5)
        .padding([.top, .horizontal])
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView() {
            Text("Hello World!")
                .padding()
        }
    }
}
