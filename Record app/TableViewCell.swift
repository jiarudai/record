//
//  TableViewCell.swift
//  Record app
//
//  Created by Judy Dai on 2020/5/16.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var imagephotolibrary: UIImageView!
    
    @IBOutlet weak var lblcreatepicturetime: UILabel!
    
    @IBOutlet weak var lblcameralens: UILabel!
    
    @IBOutlet weak var lblshutter: UILabel!
    
    @IBOutlet weak var lblfilter: UILabel!
    
    @IBOutlet weak var lbldiaphgram: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
