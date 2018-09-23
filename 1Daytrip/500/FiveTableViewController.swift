//
//  500TableViewController.swift
//  1Daytrip
//
//  Created by Kanyaneee Promma on 19/2/2561 BE.
//  Copyright © 2561 Kanyaneee Promma. All rights reserved.
//

import UIKit

class FiveTableViewController: UITableViewController {
    let URL_ME = "https://kanyanee.000webhostapp.com/comsci_1DayTrip/select500.php"
    var indexRow : Int! = nil

    var myData:NSArray = []

    func getJSONFromUrl(){
        if let url = NSURL(string:URL_ME)
        {
            if let data = NSData(contentsOf:url as URL)
            {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)  as? NSArray
                {
                    self.myData = jsonObj! as! [Any] as NSArray
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! FiveTableViewCell
        
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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "fiveSegue"
        {
            
            if let cell = sender as? UITableViewCell
            {
                
                let i = self.tableView.indexPath(for: cell)!.row
                indexRow = i
                let vc = segue.destination as!
                FiveViewController
                
                
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
