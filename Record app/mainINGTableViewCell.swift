//
//  mainINGTableViewCell.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit

class mainINGTableViewCell: UITableViewCell {


    @IBOutlet weak var Lblcreatetime: UILabel!
    
    @IBOutlet weak var Lblcameraname: UILabel!
    
    @IBOutlet weak var Lblfilmbrand: UILabel!
    
    @IBOutlet weak var Lblfilmname: UILabel!
    
    @IBOutlet weak var Lblfilmiso: UILabel!
    
    @IBOutlet weak var Lblisexpiry: UILabel!
    

    @IBAction func btnmovetofinishstatus(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
