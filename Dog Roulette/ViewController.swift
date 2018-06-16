//
//  ViewController.swift
//  Dog Roulette
//
//  Created by Cortland on 6/4/18.
//  Copyright © 2018 Cortland Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var store: YoutubeStore!
    
    var r: [String] = []
    
    var errorMessage = ""
    
    // For Testing
    var items: [String] = ["We", "Heart", "Swift"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.r.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = self.r[indexPath.row]
        
        return cell
        
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchVideos(vidSearch: String? = "") /* -> [String]  */{
        
        let url = YoutubeAPI.init().youtubeURL(query_params: vidSearch!)
        let request = URLRequest(url: url)
        
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let result = self.getVideos(data)
                print(result.description)
            }
        }
        
        task.resume()
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


