//
//  Extension.swift
//  1Daytrip
//
//  Created by Kanyaneee Promma on 15/2/2561 BE.
//  Copyright © 2561 Kanyaneee Promma. All rights reserved.
//
import UIKit
import Foundation

extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
let boundary = "Boundary-\(NSUUID().uuidString)"
var Topic_ID = ""
var Topic_Name = ""
var Description = ""
var Image = ""
var Price = ""
let ip = "http://iot.spu.ac.th"
let requestImageN = "https://kanyanee.000webhostapp.com/comsci_1DayTrip/Image/"
let requestImageTest  = "http://iot.spu.ac.th/~comsci/comsci_1DayTrip/Image/998.jpg"
func get_image(_ url_str:String, _ imageView:UIImageView)
{
    
    let url:URL = URL(string: url_str)!
    let session = URLSession.shared
    
    let task = session.dataTask(with: url, completionHandler: {
        (
        data, response, error) in
        
        
        if data != nil
        {
            let image = UIImage(data: data!)
            
            if(image != nil)
            {
                
                DispatchQueue.main.async(execute: {
                    
                    imageView.image = image
                    imageView.alpha = 0
                    
                    UIView.animate(withDuration: 2.5, animations: {
                        imageView.alpha = 1.0
                    })
                    
                })
                
            }
            
        }
        
        
    })
    
    task.resume()
}


