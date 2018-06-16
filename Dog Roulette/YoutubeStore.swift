//
//  YoutubeStore.swift
//  Dog Roulette
//
//  Created by Cortland on 6/4/18.
//  Copyright © 2018 Cortland Walker. All rights reserved.
//

import Foundation
import UIKit

class YoutubeStore {
    
    typealias JSONDictionary = [[String: Any]]
    
    var return_list: [String] = []
    
    
    @IBOutlet var myUIView: UITableView?
    
    /*
    func fetchVideos(vidSearch: String? = "") {
        
        let url = YoutubeAPI.init().youtubeURL(query_params: vidSearch!)
        let request = URLRequest(url: url)
        // Req
        let task = session.dataTask(with: request) {
            (data, response, error) in
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                        self.return_list += self.getVideos(data)
                        //print(did.description)
                    }
        }
        
        task.resume()
    
    }
 */
    
    
    
}
