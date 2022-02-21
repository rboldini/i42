//
//  ContentView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    var body: some View {
        if (network.logged) {
            HomeView()
                .environmentObject(network)
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
