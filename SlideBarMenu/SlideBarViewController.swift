//
//  SlideBarViewController.swift
//  SlideBarMenu
//
//  Created by Preuttipan Janpen on 11/10/2561 BE.
//  Copyright © 2561 Lphant. All rights reserved.
//

import UIKit
import SWRevealViewController

class SlideBarViewController: UIViewController {

    @IBOutlet weak var closeSlideBar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.closeSlideBar.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
    
    @IBAction func onClickSentPayload(_ sender: Any) {
        print("in post")
        
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil, userInfo: ["Renish":"Dadhaniya"])
    }
}
