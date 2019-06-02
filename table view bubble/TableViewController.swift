//
//  TableViewController.swift
//  table view bubble
//
//  Created by Ty Schenk on 6/1/19.
//  Copyright © 2019 Ty Schenk. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	let devices: [String] = ["iPhone", "iPad", "Apple Watch", "iMac", "iMac Pro", "MacBook", "MacBook Pro", "MacBook Air", "AirPods", "HomePod", "Apple TV"]
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView.delegate = self
		self.tableView.dataSource = self
    }

    // MARK: - Table view data source
	func numberOfSections(in tableView: UITableView) -> Int {
        return self.devices.count
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
	
	// Set the spacing between sections
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 10
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = UIColor.clear
		return headerView
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sample", for: indexPath)
		
		cell.layer.cornerRadius = 10
		cell.layer.masksToBounds = true
		cell.backgroundColor = UIColor(red:52/255.0, green:52/255.0, blue:52/255.0, alpha:1.0)
		cell.textLabel?.text = self.devices[indexPath.section]
		cell.textLabel?.textColor = .white

        return cell
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("selected \(self.devices[indexPath.section])")
		self.tableView.deselectRow(at: indexPath, animated: true)
	}

    // Override to support conditional editing of the table view.
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false to disable editing
        return false
    }
}
