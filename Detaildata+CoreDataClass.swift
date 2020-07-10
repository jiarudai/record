//
//  Detaildata+CoreDataClass.swift
//  🐷
//
//  Created by Judy Dai on 2020/7/4.
//  Copyright © 2020 Judy Dai. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Detaildata)
public class Detaildata: NSManagedObject {
 
    convenience init?(cameralens: String?, createpicturetime: String?, diaphgram: String?, filter: String?, shutter: String?) {
//         uploadimage: NSData?
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        
        self.init(entity: Detaildata.entity(), insertInto: context)
        
        self.cameralens = cameralens
        self.createpicturetime = createpicturetime
        self.diaphgram = diaphgram
        self.filter = filter
        self.shutter = shutter
//        self.uploadimage = uploadimage
    }
}
