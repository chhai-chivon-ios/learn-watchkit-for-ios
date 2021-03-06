//
//  BasicActionsNotificationController.swift
//  WatchNotifications
//
//  Created by Kim Topley on 6/17/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import WatchKit
import Foundation


class BasicActionsNotificationController: WKUserNotificationInterfaceController {
    @IBOutlet weak var alertBodyLabel: WKInterfaceLabel!
    @IBOutlet weak var cityLabel: WKInterfaceLabel!
    @IBOutlet weak var tempLabel: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        var interfaceType = WKUserNotificationInterfaceType.Default
        
        if let userInfo = localNotification.userInfo,
            let cityText = userInfo["cityLabel"] as? String,
            let tempText = userInfo["tempLabel"] as? String {
            alertBodyLabel.setText(localNotification.alertBody)
            cityLabel.setText(cityText)
            tempLabel.setText(tempText)
            interfaceType = .Custom
        }
        
        completionHandler(interfaceType)
    }
    
    /*
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
}
