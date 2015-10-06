//
//  AppointmentViewController.swift
//  KelseyHaircut2
//
//  Created by me on 3/13/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController  {
    
    
    
    @IBOutlet weak var apptWebView: UIWebView!
    
    let url = "http://www.styleseat.com/KelseyHolliday4hair"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        
        apptWebView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}