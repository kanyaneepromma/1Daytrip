//
//  AllTableViewController.swift
//  1Daytrip
//
//  Created by Kanyaneee Promma on 19/2/2561 BE.
//  Copyright © 2561 Kanyaneee Promma. All rights reserved.
//

import UIKit

class AllTableViewController: UITableViewController {

    let URL_ME = "https://kanyanee.000webhostapp.com/comsci_1DayTrip/selectTest.php"
    var indexRow : Int! = nil
    
    var myData:NSArray = []
    func getJSONFromUrl(){
        if let url = NSURL(string:URL_ME)
        {
            if let data = NSData(contentsOf:url as URL)
            {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)  as? NSArray
                {
                    self.myData = jsonObj!
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONFromUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! AllTableViewCell
        
        // Configure the cell...
        if let data:[String:Any] = myData[indexPath.row] as? [String:Any] {
            cell.txt.text = data["Topic_Name"] as? String
            //Image = (data["Image"]! as? String)!
            Image = data["Topic_ID"]! as! String
            Price = data["Price"]! as! String
            Description = data["Description"]! as! String
            
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "allSegue"
        {
            
            if let cell = sender as? UITableViewCell
            {
                
                let i = self.tableView.indexPath(for: cell)!.row
                indexRow = i
                let vc = segue.destination as!
                AllViewController
                
                
                let data:[String:Any] = (myData[indexRow] as?
                    [String:Any])!
                
                vc.imageName = (data["Topic_ID"] as? String)!
                
                //print(vc.imageName)
                vc.message = data["Description"] as? String
                vc.topic = data["Topic_Name"] as? String
                
            }
        }
    }

}
