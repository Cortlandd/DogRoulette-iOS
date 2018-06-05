//
//  YoutubeStore.swift
//  Dog Roulette
//
//  Created by Cortland on 6/4/18.
//  Copyright © 2018 Cortland Walker. All rights reserved.
//

import Foundation

enum YoutubeResult {
    case success([YoutubeVideo])
    case failure(Error)
}

class YoutubeStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    func fetchVideos(vidSearch: String = "") {
        let url = YoutubeAPI.init().youtubeURL(query_params: vidSearch)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            if let jsonData = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    print(jsonObject)
                } catch let error {
                    print("Error Creating json Object: \(error) ")
                }
            } else if let requestError = error {
                print("Error fetching videos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
    
    
    func fetchId() {
        //var fetchVideosResult = fetchVideos
        
        
    }
    
}
