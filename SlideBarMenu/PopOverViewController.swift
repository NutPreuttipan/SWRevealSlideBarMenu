//
//  PopOverViewController.swift
//  SlideBarMenu
//
//  Created by Preuttipan Janpen on 12/10/2561 BE.
//  Copyright © 2561 Lphant. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableViewCountryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableViewCountryList.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        
        return cell
    }

}
