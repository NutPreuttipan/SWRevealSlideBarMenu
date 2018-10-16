//
//  ViewController.swift
//  SlideBarMenu
//
//  Created by Preuttipan Janpen on 11/10/2561 BE.
//  Copyright © 2561 Lphant. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var buttonSlideBar: UIButton!
    
    @IBOutlet weak var buttonPopOver: UIButton!
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
    
    
    @IBAction func onClickPopOver(_ sender: Any) {
        let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "popover") as! PopOverViewController
        popoverContent.preferredContentSize = CGSize(width: 500, height: 300)
        popoverContent.modalPresentationStyle = .popover

        let popOverVC = popoverContent.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.buttonPopOver
        popOverVC?.sourceRect = CGRect(x: self.buttonPopOver.bounds.maxX/2, y: self.buttonPopOver.bounds.maxY/2, width: 0, height: 0)

        self.present(popoverContent, animated: true)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

