//
//  mainINGTableViewCell.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit

protocol mainINGTableViewDelegate {
    func mainINGTableViewCellDidFinishStatus(_ sender: mainINGTableViewCell)
}

class mainINGTableViewCell: UITableViewCell {

    var delegate: mainINGTableViewDelegate?
    
    @IBOutlet weak var Lblcreatetime: UILabel!
    
    @IBOutlet weak var Lblcameraname: UILabel!
    
    @IBOutlet weak var Lblfilmbrand: UILabel!
    
    @IBOutlet weak var Lblfilmname: UILabel!
    
    @IBOutlet weak var Lblfilmiso: UILabel!
    
    @IBOutlet weak var Lblisexpiry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
  
    @IBAction func btnFinishStatus(_ sender: Any) {
        delegate?.mainINGTableViewCellDidFinishStatus(self)
    }
    
}
