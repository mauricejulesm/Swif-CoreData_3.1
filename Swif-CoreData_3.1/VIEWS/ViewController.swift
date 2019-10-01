//
//  ViewController.swift
//  Swif-CoreData_3.1
//
//  Created by Maurice on 10/1/19.
//  Copyright © 2019 maurice. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializing the persistent containter
        container = NSPersistentContainer(name: "Project38")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
		performSelector(inBackground: #selector(fetchCommits), with: nil)
    }
	
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
	
	@objc func fetchCommits() {
		if let data = try? String(contentsOf: URL(string: "https://api.github.com/repos/apple/swift/commits?per_page=100")!) {
			// give the data to SwiftyJSON to parse
			let jsonCommits = JSON(parseJSON: data)
			
			// read the commits back out
			let jsonCommitArray = jsonCommits.arrayValue
			
			print("Received \(jsonCommitArray.count) new commits.")
			
			DispatchQueue.main.async { [unowned self] in
				for jsonCommit in jsonCommitArray {
					// the following three lines are new
					let commit = Commit(context: self.container.viewContext)
					self.configure(commit: commit, usingJSON: jsonCommit)
				}
				
				self.saveContext()
			}
		}
	}
	
	func configure(commit: Commit, usingJSON json: JSON) {
		commit.sha = json["sha"].stringValue
		commit.message = json["commit"]["message"].stringValue
		commit.url = json["html_url"].stringValue
		
		let formatter = ISO8601DateFormatter()
		commit.date = formatter.date(from: json["commit"]["committer"]["date"].stringValue) ?? Date()
	}


}
