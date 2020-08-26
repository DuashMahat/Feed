//
//  FeedPath.swift
//  Feed
//
//  Created by Duash on 8/25/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

import Foundation

final class UrlPath {
    static let path = UrlPath()
    private init() {}
    private var path = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/50/explicit.json"
    func shared() -> String {
       return path
    }
}



