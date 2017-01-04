//
//  ViewController.swift
//  examplePrj
//
//  Created by Amit on 01/01/2017.
//  Copyright © 2017 mobi-Wiz. All rights reserved.
//

import UIKit
import tweetSearchKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var resultsArr:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        //Example use of framework
        let authClass = TwitterOAuthClass(AppConsumerKey: "QiwdLA3iubELTJc70JLjm0USj", AppConsumerSecret: "vQwJSB3p1Grn7X94bETvWp73jA9CSZ4OkZbBXj8gEcjg0zjHhq")
        
        authClass.authenticateAndSerach(UserSearchString: "App"){
            (arr: NSMutableArray) in
            print("got this array back: \(arr)")
            self.resultsArr = arr
            
            self.tableView.reloadData()
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = resultsArr[indexPath.row] as? String
        
        return cell
    }
    
    
}

