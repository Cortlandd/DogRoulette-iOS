//
//  YoutubeAPI.swift
//  Dog Roulette
//
//  Created by Cortland on 6/4/18.
//  Copyright © 2018 Cortland Walker. All rights reserved.
//

import Foundation

struct YoutubeAPI {
    
    private let baseURL: String = "https://www.googleapis.com/youtube/v3/search"
    private let apiKey: String = "AIzaSyCWDXs_WwDOK3XQu8MPUx9aSdfJ8KOPfRE"
    
    
    func youtubeURL(query_params: String = "") -> URL {
        
        var components = URLComponents(string: baseURL)
        
        var queryItems = [URLQueryItem]()
        
        // Random words to be queries
        let sQuery: [String] = ["dog videos ", "adorable dogs ", "funny dogs ", "nice dogs "]
        
        // Getting random index of the array
        let randomIndex = Int(arc4random_uniform(UInt32(sQuery.count)))
        
        // Get random string from array for search
        var word: String = sQuery[randomIndex]
        
        // REMOVE LATER
        print(word)
        
        // If a user doesn;t enter text in the filter bar, use the default query
        if (query_params != "") {
            word += query_params
        }
        
        let baseParams = [
            "q": word,
            "part": "id, snippet",
            "start_index": (50-49).description,
            "safeSearch":"none",
            "key": apiKey,
            "type": "video",
            "maxResults": 50.description
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        /*
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        */
        
        components?.queryItems = queryItems
        
        print(components!.url!)
        return components!.url!
    }
    
    /*
    static func getVid(fromJSON data: Data) -> YoutubeResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let items = jsonDictionary["items"] as? [String:Any],
                let itemsArray = items["id"] as? [String:Any],
                let videoid = itemsArray["videoId"] as? String
            else {
                    return .failure("Failed" as! Error)
                }
            print(videoid)
            
            }
        
        
            var finalVideo = [YoutubeVideo]()
            return .success(finalVideo)
        } catch let error {
            return .failure(error)
        }
    }
    */
    
}
