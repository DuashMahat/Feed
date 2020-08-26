//
//  Feed.swift
//  Feed
//
//   Created by Duash on 8/26/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation


struct FeedContainer : Codable {
    let feed : Feed
}

struct Feed : Codable {
    var title: String
    var id: String
    var copyright, country: String
    var icon: String
    var updated: String
    var results: [Result]
}


struct Result: Codable {
    var artistName, id, name, collectionName: String
    var artworkUrl100: String?
    var url: String?
    var releaseDate: String?
}

