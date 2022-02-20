//
//  ContentView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var logged = false
    var body: some View {
        if (logged) {
//            HomeView()
        }
        else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
