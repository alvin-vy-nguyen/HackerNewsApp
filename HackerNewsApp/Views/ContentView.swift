//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Alvin Nguyen on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.cyan
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    var body: some View {
        // NavigationStack allows us to move between views
        // Used in conjuction with NavigationLink
        
        NavigationStack {
            List(networkManager.posts) { post in
                // NavigationLink creates an arrow button on the right which can create a view on top of the root view
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .background(Color.teal)
            .scrollContentBackground(.hidden)
            .navigationTitle("Hacker News")
        }
        // This method is like our ViewDidLoad
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}
