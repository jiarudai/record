//
//  Projectdata+CoreDataProperties.swift
//  🐷
//
//  Created by Judy Dai on 2020/8/2.
//  Copyright © 2020 Judy Dai. All rights reserved.
//
//

import Foundation
import CoreData


extension Projectdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Projectdata> {
        return NSFetchRequest<Projectdata>(entityName: "Projectdata")
    }

    @NSManaged public var cameraname: String?
    @NSManaged public var createfiletime: String?
    @NSManaged public var filmbrand: String?
    @NSManaged public var filmiso: String?
    @NSManaged public var filmname: String?
    @NSManaged public var isexpiry: String?
    @NSManaged public var camName: NSOrderedSet?

}

// MARK: Generated accessors for camName
extension Projectdata {

    @objc(insertObject:inCamNameAtIndex:)
    @NSManaged public func insertIntoCamName(_ value: Detaildata, at idx: Int)

    @objc(removeObjectFromCamNameAtIndex:)
    @NSManaged public func removeFromCamName(at idx: Int)

    @objc(insertCamName:atIndexes:)
    @NSManaged public func insertIntoCamName(_ values: [Detaildata], at indexes: NSIndexSet)

    @objc(removeCamNameAtIndexes:)
    @NSManaged public func removeFromCamName(at indexes: NSIndexSet)

    @objc(replaceObjectInCamNameAtIndex:withObject:)
    @NSManaged public func replaceCamName(at idx: Int, with value: Detaildata)

    @objc(replaceCamNameAtIndexes:withCamName:)
    @NSManaged public func replaceCamName(at indexes: NSIndexSet, with values: [Detaildata])

    @objc(addCamNameObject:)
    @NSManaged public func addToCamName(_ value: Detaildata)

    @objc(removeCamNameObject:)
    @NSManaged public func removeFromCamName(_ value: Detaildata)

    @objc(addCamName:)
    @NSManaged public func addToCamName(_ values: NSOrderedSet)

    @objc(removeCamName:)
    @NSManaged public func removeFromCamName(_ values: NSOrderedSet)

}
