//
//  HomeView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var network: Network
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CardView() {
                        HStack {
                            Image(systemName: "hexagon.fill")
                                .font(.title)
                                .padding()
                            Text("Projects")
                                .font(Font.title)
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, alignment: .leading)
//                        .background(.blue)
                        VStack {
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.3, alignment: .topLeading)
                    }
                    CardView() {
                        HStack {
                            Image(systemName: "calendar")
                                .font(.title)
                                .padding()
                            Text("Events")
                                .font(Font.title)
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, alignment: .leading)
//                        .background(.red)
                        VStack {
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.3, alignment: .topLeading)
                    }
                    Text(" ")
                    Spacer()
                    Text("Developed by rboldini")
                        .font(.caption)
                }
                .navigationBarItems(
                    leading: Image("logo") // Should be button that trigger the menu bar
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center),
                    trailing: Image(systemName: "person.circle.fill")  // Should be PersonalData?.imageURL
                        .font(.title2)
                )
            }
//            .background(.background)
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Network())
    }
}
