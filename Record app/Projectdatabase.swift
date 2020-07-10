//
//  Projectdatabase.swift
//  🐷
//
//  Created by Judy Dai on 2020/6/2.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Projectdatabase{
    static var shareInstance = Projectdatabase()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func save(object:[String:String]){
        let projectdata = NSEntityDescription.insertNewObject(forEntityName: "Projectdata", into: context) as! Projectdata
        projectdata.createfiletime = object["createfiletime"]
        projectdata.cameraname = object["cameraname"]
        projectdata.filmbrand = object["filmbrand"]
        projectdata.filmname = object["filmname"]
        projectdata.filmiso = object["filmiso"]
        projectdata.isexpiry = object["isexpiry"]
        do {
            try context.save()
        } catch  {
            print("data is not save")
        }

    }

    func getFilmProjectData() -> [Projectdata]{
        var projectdata = [Projectdata]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Projectdata")
        do {
            projectdata = try context.fetch(fetchRequest) as! [Projectdata]
        } catch {
            print("can not get data")
        }
        return projectdata
    }

    func deleteFilmProjectData(index:Int) -> [Projectdata]{
        var projectdata = getFilmProjectData()
        context.delete(projectdata[index])
        projectdata.remove(at: index)
        do{
            try context.save()
        } catch {
            print("can not delete data")
        }
        return projectdata
    }

    //    func movetoFinishProjectData(index:Int) -> [Projectdata]{
    //
    //    }
}
