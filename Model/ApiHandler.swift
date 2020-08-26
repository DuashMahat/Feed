//
//  ApiHandler.swift
//  Feed
//
//  Created by Duash on 8/25/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class Networking  {
   func response (url: String , completion: @escaping (FeedContainer, Error?) -> () ) {
       guard let url = URL(string: url) else {return}
       URLSession.shared.dataTask(with: url) { (data, response, error) in
        DispatchQueue.main.async {
           self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
        }
       }.resume()
   }
   
   
   func urlCompletionHandler (data: Data? , response: URLResponse? , error: Error? , completion: @escaping (FeedContainer, Error?) -> () ) {
       guard let data = data else {return}
       do {
          let jsondecoder = JSONDecoder()
          let feeds  = try jsondecoder.decode(FeedContainer.self, from: data)
        completion(feeds, error)
       } catch {
        print(error)
       }
   }
}
