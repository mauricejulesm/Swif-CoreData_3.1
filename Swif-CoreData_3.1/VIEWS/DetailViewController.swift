//
//  DetailViewController.swift
//  Swif-CoreData_3.1
//
//  Created by Maurice on 10/1/19.
//  Copyright © 2019 maurice. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailItem: Commit?
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detail = self.detailItem {
            detailLabel.text = detail.message
            // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }
    }
}
