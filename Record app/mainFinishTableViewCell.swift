//
//  mainFinishTableViewCell.swift
//  🐷
//
//  Created by Judy Dai on 2020/8/12.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit


class mainFinishTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblfinishcreatetime: UILabel!
    
    @IBOutlet weak var lblfinishcameraname: UILabel!
    
    @IBOutlet weak var lblfinishfilmbrand: UILabel!
    
    @IBOutlet weak var lblfinishfilname: UILabel!
    
    @IBOutlet weak var lblfinishfilmiso: UILabel!
    
    @IBOutlet weak var lblfinishfilmexpiry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
