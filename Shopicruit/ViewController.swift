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
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        var requestUrl = "http://shopicruit.myshopify.com/products.json?page="
        var counter = 1
        var keepSwitchingPages = true
        print("loading data")
        while(keepSwitchingPages){
            requestUrl += String(counter)
            counter += 1
            let url = NSURL(string: requestUrl)
            
            print("attempting first request")
            
            let data = NSData(contentsOfURL: url!)
             //let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
                print("making first request")
                
                if data != nil{
                    
                    print("receiving data from shopicruit endpoint")
                    var jsonDataDictionary = NSDictionary()
                    do{
                        let jSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                        guard let jsonDataX = jSON as? NSDictionary else{
                          print("not a dictionary")
                          print("error retrieving json object")
                          return
                        }
                        jsonDataDictionary = jsonDataX
                        
                    }catch let jsonError as NSError{
                        print("\(jsonError)")
                    }
                    
               
                        
                        var productsArray = jsonDataDictionary.objectForKey("products") as! NSArray
                        
                        print("making first request")

                        for product in productsArray{
                            print("----product printed----")
                            print(product)
                        }
                        
                        
                        
  
                    

                }else{
                    
                    //show error message
                    print("error")
                }
            
            keepSwitchingPages = false

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

