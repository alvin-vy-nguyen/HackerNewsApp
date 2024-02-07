//
//  PostData.swift
//  HackerNewsApp
//
//  Created by Alvin Nguyen on 2/4/24.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // Use computed property to return objectID as the id
    // Need to conform identifiable which requires an id, in order to use our list and for the list to know how to order each item
    var id: String {
        return objectID
    }
    let objectID: String // uniquely identifies each post in database
    let title: String
    let points: Int
    let url: String? // Optional as certain case url will be null
}
