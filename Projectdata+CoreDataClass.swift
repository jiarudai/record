//
//  Projectdata+CoreDataClass.swift
//  🐷
//
//  Created by Judy Dai on 2020/7/4.
//  Copyright © 2020 Judy Dai. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Projectdata)
public class Projectdata: NSManagedObject {
    var detaildata: [Detaildata]? {
        return self.camName?.array as? [Detaildata]
    }

    convenience init?(cameraname: String?, createfiletime: String?, filmbrand: String?, filmiso: String?, filmname: String?, isexpiry: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        
        self.init(entity: Projectdata.entity(), insertInto: context)
        
        self.cameraname = cameraname
        self.createfiletime = createfiletime
        self.filmbrand = filmbrand
        self.filmiso = filmiso
        self.filmname = filmname
        self.isexpiry = isexpiry
    }
}
