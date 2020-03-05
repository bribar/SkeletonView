//
//  DisplayIssueViewController.swift
//  Skeleton
//
//  Created by Brian Barton on 3/3/20.
//

import UIKit
import SkeletonView

class DisplayIssueViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [String] = [String]()
    var sectionData: [[String]] = [[String]]()
    
    var skeletonIsShowing = true
    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        sectionData[0].insert("Mo", at: 0)
        
        let indexPath = IndexPath(item: 0, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .none)
        
        tableView.endUpdates()
        
        tableView.hideSkeleton()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        
        tableView.register(UINib(nibName: "Table2Cell", bundle: nil) , forCellReuseIdentifier: "tableCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = 50.0
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) {
            
            self.sections = ["Good Guys","Bad Guys","Good Girls","Bad Girls"]
            self.sectionData = [
                 ["Matthew","Mark","Luke","John"],
                 ["Cain","Lucifer","Devil"],
                 ["Eve","Mary"],
                 ["Bathsheba","Unknown","Unknown","Unknown","Unknown"]
            ]
            self.tableView.hideSkeleton()
            self.tableView.reloadData()
            
        }
    }

}

extension DisplayIssueViewController: SkeletonTableViewDelegate, SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionData[section].count
        
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "tableCell"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: Table2Cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! Table2Cell
        
        cell.tableCellLabel.text = "cell => \(sectionData[indexPath.section][indexPath.row])"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sections.count == 0 {
            
            return nil
            
        }else{
            
            return sections[section]
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
