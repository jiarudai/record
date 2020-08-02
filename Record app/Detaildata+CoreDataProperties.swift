//
//  Detaildata+CoreDataProperties.swift
//  🐷
//
//  Created by Judy Dai on 2020/7/26.
//  Copyright © 2020 Judy Dai. All rights reserved.
//
//

import Foundation
import CoreData


extension Detaildata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detaildata> {
        return NSFetchRequest<Detaildata>(entityName: "Detaildata")
    }

    @NSManaged public var cameralens: String?
    @NSManaged public var createpicturetime: String?
    @NSManaged public var diaphgram: String?
    @NSManaged public var filter: String?
    @NSManaged public var shutter: String?
    @NSManaged public var uploadimage: NSData?
    @NSManaged public var owner: Projectdata?

}
