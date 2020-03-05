//
//  ViewController.swift
//  instaSample2
//
//  Created by 岡田昂典 on 2020/03/05.
//  Copyright © 2020 Kosuke Okada. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var timelineTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineTableView?.dataSource = self
        timelineTableView?.delegate = self
        
        let nib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle.main)
        timelineTableView?.register(nib, forCellReuseIdentifier: "Cell")
        
        timelineTableView?.tableFooterView = UIView()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TimelineTableViewCell
        
        cell.userNameLabel.text = "サンプル"
        
        return cell
    }


}

