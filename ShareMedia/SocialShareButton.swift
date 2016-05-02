//
//  SocialShareButton.swift
//  ShareMedia
//
//  Created by EkambaramE on 24/02/16.
//  Copyright © 2016 EkambaramE. All rights reserved.
//

import UIKit
/**
 Sharing content to social media
 
 @Utilize the shareInit method to specifiy the media information like image, message and url. Similarly use targetController to specify controller where this functionality is required.
 
 */

class SocialShareButton: UIButton
{
    
    var shareImage : UIImage!
    var shareMessage : String!
    var shareURL : NSURL!
    var targetController : UIViewController!
    var shareType : String!
    
    func shareInit (shareMessage:String, targetController : UIViewController, shareType : String!) {
        self.shareType = shareType
        self.shareMessage = shareMessage
        self.targetController = targetController
        self.addTarget(self, action: "shareContent:", forControlEvents: .TouchUpInside)
    }
    
    func shareInit (shareMessage:String, shareURL:NSURL, targetController : UIViewController, shareType : String!) {
        self.shareURL = shareURL
        self.shareInit(shareMessage,targetController: targetController, shareType : shareType)
    }
    
    func shareInit (shareMessage:String, shareURL:NSURL, shareImage:UIImage, targetController : UIViewController, shareType : String!) {
        self.shareImage = shareImage
        self.shareInit(shareMessage, shareURL: shareURL,targetController: targetController, shareType : shareType)
    }
    
    
    //Share social media using activity controller
    func shareContent (sender:UIButton!) {
        
        if shareType.isEqual("share") {
            var shareItems : Array = [AnyObject]()
            
            if !self.shareMessage.isEmpty{
                shareItems.append(self.shareMessage)
            }
            if self.shareURL != nil{
                shareItems.append(self.shareURL)
            }
            if self.shareImage != nil {
                shareItems.append(self.shareImage)
            }
            
            let activityController = UIActivityViewController(activityItems:shareItems, applicationActivities: nil)
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                activityController.popoverPresentationController?.sourceView = self.targetController.view
            }
            self.targetController.presentViewController(activityController, animated: true,completion: nil)
        } else {
            if UIApplication.sharedApplication().canOpenURL(self.shareURL) {
                UIApplication.sharedApplication().openURL(self.shareURL)
            } else {
                UIApplication.sharedApplication().openURL(self.shareURL)
            }
        }
    }
}
