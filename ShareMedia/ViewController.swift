//
//  ViewController.swift
//  ShareMedia
//
//  Created by EkambaramE on 24/02/16.
//  Copyright © 2016 EkambaramE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shareButton: SocialShareButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         shareButton.shareInit("", shareURL: NSURL(string: "https://www.facebook.com/KemperSystemAmericaInc")!, targetController: self, shareType: "openURL")
        
     //  shareButton.shareInit("test", shareURL: NSURL(string: "Testing")!,targetController: self)
      // shareButton.shareInit("test", shareURL: NSURL(string: "Testing")!, shareImage: UIImage(named: "logo.jpg")!,targetController: self)
        
//        shareButton.shareImage = UIImage(named: "logo.jpg")
//        shareButton.shareMessage = "test"
//        shareButton.shareURL = NSURL(string: "Testing");
       // shareButton.view = self.view
   
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}