//
//  NetworkingViewModel.swift
//  Feed
//
//  Created by Duash on 8/26/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

final class NetworkingViewModel: NSObject {
    private var appiHandler = Networking()
    var error: Error?
    var results = [Result]()
    var filtereResults = [Result]()
    var dictOfResults = [[Date : Result]]()
    func response ( url: String  , completion: @escaping (FeedContainer) -> ()) {
        appiHandler.response(url: url) { [weak self] results,error  in
            self?.error = error
            self?.results = results.feed.results
            completion(results)
        }
    }
    
    func convertToDate ( date : String ) -> Date {
        let realdate  = SingletonDateFormatter.shared.dateFormatter.date(from: date)
        return realdate ?? Date()
    }
    func MainResults  () -> [Result] {
       results = results.sorted { (a, b) -> Bool in
            guard let a = a.releaseDate , let b = b.releaseDate else {return false}
            let dateA = convertToDate(date: a)
            let dateB  = convertToDate(date: b)
            return dateA < dateB
        }
        return results.reversed()
    }
    
    func filteredResults () -> [Result] {
       return filtereResults
    }
    
    func getError() -> Error? {
        return error
    }
    
    func MainCount () -> Int {
        return MainResults().count
    }
    
    func filteredCount() -> Int {
        return filtereResults.count
    }
    
    func getArtatIndexMain (index: Int ) -> Result {
        return MainResults()[index]
    }
    
    func getArtatIndexAtFilered (index: Int ) -> Result {
       return filtereResults[index]
    }
    
    
}

//inhance performance and dont init it in every object while sort...
class SingletonDateFormatter {
    
    static let shared = SingletonDateFormatter.init()
    let dateFormatter = DateFormatter()
    private init() {
                dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}
