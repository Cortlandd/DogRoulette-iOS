//
//  ViewController.swift
//  Dog Roulette
//
//  Created by Cortland on 6/4/18.
//  Copyright © 2018 Cortland Walker. All rights reserved.
//

import UIKit
import Alamofire
import YoutubeKit

class ViewController: UIViewController {
    
    //var store: YoutubeStore!
    
    @IBOutlet weak var playerView: YTSwiftyPlayer!
    
    var r = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new player
        playerView = YTSwiftyPlayer(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300), playerVars: [.autoplay(true), .videoID("V1EYgeTER_I")])
        
        view.addSubview(playerView)
        
        // Set delegate for detect callback information from the player.
        playerView.delegate = self as YTSwiftyPlayerDelegate
        
        // Load the video.
        playerView.loadPlayer()
        
        /*
        let my_url = YoutubeAPI.init().youtubeURL(query_params: "")
        
        Alamofire.request(my_url).responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value as? [String: Any] {
                    if let items = json["items"] as? [[String: Any]] {
                        for vid in items {
                            if let id = vid["id"] as? [String: Any] {
                                //videos.append(id["videoId"])
                                let my_result = id["videoId"]! as! String
                                self.r.append(my_result)
                            }
                        }
                    }
                }
                
            case .failure:
                print("Error")
            }
            
            print(self.r)
        }
        */
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func getVideos(_ data: Data) -> [String] {
        var response: [String: Any]!
        var result: [String] = []
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        } catch let parseError as NSError {
            print(parseError.description)
        }
        
        if let items = response["items"] as? [[String: Any]] {
            for vids in items {
                if let id = vids["id"] as? [String: Any] {
                    //videos.append(id["videoId"])
                    let my_result = id["videoId"]! as! String
                    result.append(my_result)
                }
            }
        }
        
        return result
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: YTSwiftyPlayerDelegate {
    
    func playerReady(_ player: YTSwiftyPlayer) {
        print(#function)
    }
    
    func player(_ player: YTSwiftyPlayer, didUpdateCurrentTime currentTime: Double) {
        print("\(#function):\(currentTime)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangeState state: YTSwiftyPlayerState) {
        print("\(#function):\(state)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangePlaybackRate playbackRate: Double) {
        print("\(#function):\(playbackRate)")
    }
    
    func player(_ player: YTSwiftyPlayer, didReceiveError error: YTSwiftyPlayerError) {
        print("\(#function):\(error)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangeQuality quality: YTSwiftyVideoQuality) {
        print("\(#function):\(quality)")
    }
    
    func apiDidChange(_ player: YTSwiftyPlayer) {
        print(#function)
    }
    
    func youtubeIframeAPIReady(_ player: YTSwiftyPlayer) {
        print(#function)
    }
    
    func youtubeIframeAPIFailedToLoad(_ player: YTSwiftyPlayer) {
        print(#function)
    }
}


