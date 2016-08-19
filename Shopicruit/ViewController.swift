//
//  ViewController.swift
//  Shopicruit
//
//  Created by Fabian Vergara on 2016-08-18.
//  Copyright © 2016 fvergara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let products = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        var requestUrl = "http://shopicruit.myshopify.com/products.json?page="
        var counter = 1
        let keepSwitchingPages = true
        while(keepSwitchingPages){
            requestUrl += String(counter)
            counter += 1
            let url = NSURL(string: requestUrl)
            
            NSURLConnection.sendSynchronousRequest(url!, returningResponse: AutoreleasingUnsafeMutablePointer<NSURLResponse?>)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: "Cell")
        
        let timesTableValue = 10
        
        cell.textLabel?.text = String(timesTableValue * indexPath.row)
        
        return cell
    }


}

