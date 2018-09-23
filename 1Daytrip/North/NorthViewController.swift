//
//  NorthViewController.swift
//  1Daytrip
//
//  Created by Kanyaneee Promma on 15/2/2561 BE.
//  Copyright © 2561 Kanyaneee Promma. All rights reserved.
//

import UIKit

class AllViewController: UIViewController {
    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var text: UITextView!
    var message: String!
    var topic: String!
    var imageName: String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = message
        txt.text = topic
        if let url = NSURL(string: "\(requestImageTest)"){
            print(url)
            if let data = NSData(contentsOf:url as URL){
                if let image = UIImage(data: data as Data){
                    Img.image = image
                }
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
