//
//  HomeView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI

struct ProjectTile: View {
    var project: PersonalData.Project
    var body: some View {
        HStack {
//            Image(project.project.name.firstWord() ?? "")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 35, height: 35, alignment: .leading)
//                .padding()
            VStack(alignment: .leading, spacing: 0) {
                Text(project.project.name)
                Text(String(project.final_mark ?? 0))
//                Text(project.validated ?? false ? "Validated" : "Ongoing")
                Text(project.status.replacingOccurrences(of: "_", with: " ").capitalized)
            }.cornerRadius(5)
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 7.5, height: 15, alignment: .leading)
                .foregroundColor(.secondary)
                .padding()
        }
        .frame(height: UIScreen.screenHeight * 0.05)
        .padding()
    }
}

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
                        ScrollView {
                            ForEach (network.personalData?.projects_users ?? []) { project in
                                ProjectTile(project: project)
                            }
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
                        ScrollView {
                            ForEach (network.userEvents ?? []) {event in
                                VStack {
                                    Text("__________________________")
                                    Text(String(event.id))
                                    Text(event.name)
                                        .font(.title3)
                                    Text(event.description)
                                        .font(.caption2)
                                    Text(event.end_at)
                                }
                            }
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.3, alignment: .topLeading)
                    }
                    Text(" ")
                    Text(network.personalData?.campus[0].address ?? "Missing?")
                        .font(.caption)
                    Text("Developed by rboldini")
                        .font(.caption)
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
                    try await network.getRequest(path: "/me")
                    try await network.getEvents()
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
