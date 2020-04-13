//
//  TableViewCell.swift
//  sampleLayout
//
//  Created by Third Rock Techkno on 21/02/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellPriceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()


      
      

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
