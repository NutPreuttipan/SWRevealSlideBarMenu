//
//  ViewController.swift
//  SlideBarMenu
//
//  Created by Preuttipan Janpen on 11/10/2561 BE.
//  Copyright © 2561 Lphant. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController {

    @IBOutlet weak var buttonSlideBar: UIButton!
    
    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
        if (self.revealViewController() != nil) {
            
            // enable navigation item to open and close Drawer
//            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            // enable to slide to open Drawer
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
//            self.navigationItem.leftBarButtonItem?.target = revealViewController()
//            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
            buttonSlideBar.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        }
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let name = userInfo["Renish"] as? String
            else { return }
        labelTest.text = name
    }

}

