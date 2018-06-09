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
    
    typealias JSONDictionary = [[String: Any]]
    
    var return_list: [String] = []
    
    var errorMessage = ""
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    func fetchVideos(vidSearch: String = "") {
        
        let url = YoutubeAPI.init().youtubeURL(query_params: vidSearch)
        let request = URLRequest(url: url)
        // Req
        let task = session.dataTask(with: request) {
            (data, response, error) in
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    let did = self.getVideos(data)
                    print(did.description)
                }
            
        }
        
        task.resume()
    
    }
    

    fileprivate func getVideos(_ data: Data) -> [String] {
        var response: [String: Any]!
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        } catch let parseError as NSError {
            print(parseError.description)
        }
        
        if let items = response["items"] as? [[String: Any]] {
            for vids in items {
                if let id = vids["id"] as? [String: Any] {
                    //videos.append(id["videoId"])
                    return_list.append(id["videoId"]! as! String)
                }
            }
        }
        
        return return_list
    
    }
    
}
