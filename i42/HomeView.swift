//
//  HomeView.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
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
        //                        .padding()
                                .font(Font.title)
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, alignment: .leading)
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
        //                        .padding()
                                .font(Font.title)
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, alignment: .leading)
                        VStack {
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.3, alignment: .topLeading)
                    }
                    Text(" ")
                    Spacer()
                    Text("Developed by rboldini")
                        .font(.caption)
                }
            }
        }
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
