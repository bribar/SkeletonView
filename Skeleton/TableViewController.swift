//
//  TableViewController.swift
//  Skeleton
//
//  Created by Brian Barton on 2/10/20.
//  Copyright © 2020 Lemonade Stand. All rights reserved.
//

import UIKit
import SkeletonView

class TableViewController: UITableViewController {
    
//    private var didShow = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.isSkeletonable = true

    }
    
//    override func viewDidLayoutSubviews() {
//        if didShow { return }
//        didShow = true
//        tableView.showGradientSkeleton()
//    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.customLabel.text = "\(indexPath.row)"

        return cell
    }

}

//extension TableViewController: SkeletonTableViewDataSource {
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "cell"
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
//        cell.customLabel.text = "cell => \(indexPath.row)"
//        return cell
//    }
//}
