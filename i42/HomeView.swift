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
    let imageError = "https://e7.pngegg.com/pngimages/419/473/png-clipart-computer-icons-user-profile-login-user-heroes-sphere.png"
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
                    Text(network.personalData?.image_url ?? "Missing?")
                    Text("Developed by rboldini")
                        .font(.caption)
//                        .onAppear(perform: {() -> Void in print(network.personalData?.displayname)})
                }
                .navigationBarTitle(network.personalData?.displayname ?? "Missing Name")
                .navigationBarItems(
                    leading: Image("logo") // Should be button that trigger the menu bar
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center),
                    trailing:
                        AsyncImage(url: URL(string: network.personalData?.image_url ?? imageError), scale: 15)
                            .cornerRadius(360)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 0.05))
                )
            }
            .task {
                do {
                    try await network.newRequest(path: "/me")
                } catch {
                    print("Error", error)
                }
            }
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Network())
    }
}
