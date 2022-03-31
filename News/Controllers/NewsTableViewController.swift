//
//  ViewController.swift
//  News
//
//  Created by k u r i s u on 3/31/22.
//

import UIKit

class NewsTableViewController: UITableViewController  {
    
    
    var results : Results?
    
    override func viewDidLoad() {
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIMan.shared.getArticles {[weak self] result in
            do{
                self?.results = try result.get()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return results?.NRes ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath) as! NewsTableViewCell
        if let results = results {
            cell.titleLabel.text = "potato"
                //results.results[indexPath.section].title
            print(cell.titleLabel.text ?? "default")
            
            cell.titleLabel.text = results.results[indexPath.section].byline
            cell.dateLabel.text = results.results[indexPath.section].publishedDate
        } else {
            
        }
        
        
        return cell
        
        
    }
    
    
    
 
}

