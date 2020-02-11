//
//  Table2Cell.swift
//  Skeleton
//
//  Created by Brian Barton on 2/11/20.
//

import UIKit

class Table2Cell: UITableViewCell {

    @IBOutlet weak var tableCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableCellLabel.clipsToBounds = true
    }
    
    
    
}
