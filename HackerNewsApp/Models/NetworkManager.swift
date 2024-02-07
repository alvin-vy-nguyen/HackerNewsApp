//
//  NetworkManager.swift
//  HackerNewsApp
//
//  Created by Alvin Nguyen on 2/4/24.
//

import Foundation

class NetworkManager: ObservableObject {
    // @Published is a property wrapper that allows us to publish this variable, we then need a listener in ContentView
    @Published var posts = [Post]() // Property posts initialized as a new array of Post objects
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData) // because it can throw we need to add try
                            // The point when we use @Published, we have to fetch the main thread
                            DispatchQueue.main.async {
                                // Add self. since we are inside a closure
                                self.posts = results.hits // hits is an array of Post objects which matches posts
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() // Starts off our networking task
        }
    }
}
