//
//  Table2ViewController.swift
//  Skeleton
//
//  Created by Brian Barton on 2/11/20.
//

import UIKit
import SkeletonView

class Table2ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Table2Cell", bundle: nil) , forCellReuseIdentifier: "tableCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50.0
        tableView.isSkeletonable = true
    }
    
    override func viewDidLayoutSubviews() {
        tableView.showAnimatedGradientSkeleton()
    }

}

extension Table2ViewController: SkeletonTableViewDataSource {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "tableCell"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Table2Cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! Table2Cell
        cell.isSkeletonable = true
        cell.tableCellLabel.text = "cell => \(indexPath.row)"
        return cell
    }
}
