//
//  Network.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation
import SimpleOAuth2
import Combine

class Network: ObservableObject {
    @Published var personalData: [PersonalData] = []
    @Published var logged = false
    
    var credentials: OAuth2Credentials?
    var authManager = OAuth2Manager()
    var cancellable: AnyCancellable?
    let request: OAuth2Request = .init(
        authUrl: "https://api.intra.42.fr/oauth/authorize",
        tokenUrl: "https://api.intra.42.fr/oauth/token",
        clientId: "YOUR_INTRA42_API_CLIENT_ID",
        redirectUri: "com.42.intra42://authentication",
        clientSecret: "YOUR_INTRA42_API_CLIENT_SECRET",
        scopes: ["public"]
    )
    private let account = "SET_ACCOUNT_NAME" // Something related to your app name/company
    private let service = "SET_SERVICE_NAME" // Something related to the service you want to store in keychain
    
    func signIn() {
        self.cancellable = authManager.signIn(with: self.request)
            .sink( receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                default: break
                }
            },  receiveValue: { cred in
                    self.credentials = cred
                    KeychainHelper.standard.save(self.credentials, service: self.service, account: self.account)
                    self.getRequest(path: "/me")
                    self.logged.toggle()
                }
            )
    }
    
    func getRequest(path: String) {
        var endPoint = "https://api.intra.42.fr/v2"
        endPoint = endPoint.appending(path)
        guard let url = URL(string: endPoint) else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue( "no-cache, no-store", forHTTPHeaderField: "Cache-Control")
        urlRequest.setValue( "Bearer \(self.credentials?.accessToken ?? "NO_TOKEN")", forHTTPHeaderField: "Authorization")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([PersonalData].self, from: data)
                        self.personalData = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else {print("Response error code: \(response.statusCode)")}
        }
        dataTask.resume()
    }
}
