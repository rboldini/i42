//
//  Network.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation


class Network: ObservableObject {
    @Published var personalData: [PersonalData] = []
    var token: String = ""
    
    func signIn() {
//        cancellable = authManager.signIn(with: request)
//            .sink( receiveCompletion: { result in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                default: break
//                }
//            },  receiveValue: { cred in
//                    credentials = cred
//                    KeychainHelper.standard.save(credentials, service: service, account: account)
//                    requestPersonalData(token: credentials?.accessToken ?? "", path: "/me")
//                    logged.toggle()
//                }
//            )
    }
    
    func getRequest(path: String) {
        var endPoint = "https://api.intra.42.fr/v2"
        endPoint = endPoint.appending(path)
        guard let url = URL(string: endPoint) else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue( "no-cache, no-store", forHTTPHeaderField: "Cache-Control")
        urlRequest.setValue( "Bearer \(self.token)", forHTTPHeaderField: "Authorization")

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
