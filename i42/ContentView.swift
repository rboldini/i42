//
//  ContentView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State var logged = true
    var body: some View {
        if (logged) {
            HomeView()
        }
        else {
            LoginView()
                .environmentObject(network)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
