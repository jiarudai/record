////
////  DatabaseHelper.swift
////  Record app
////
////  Created by Judy Dai on 2020/5/16.
////  Copyright © 2020 Judy Dai. All rights reserved.
////
//
//import Foundation
//import CoreData
//import UIKit
//
//class DatabaseHelper{
//    static var shareInstance = DatabaseHelper()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    func save(object:[String:String]){
//        let detaildata = NSEntityDescription.insertNewObject(forEntityName: "Detaildata", into: context) as! Detaildata
//        detaildata.createpicturetime = object["createpicturetime"]
//        detaildata.cameralens = object["cameralens"]
//        detaildata.diaphgram = object["diaphgram"]
//        detaildata.shutter = object["shutter"]
//        detaildata.filter = object["filter"]
//        do {
//            try context.save()
//        } catch  {
//            print("data is not save")
//        }
//
//    }
//
//    func getFilmDetailData() -> [Detaildata]{
//        var detaildata = [Detaildata]()
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Detaildata")
//        
//        do {
//            detaildata = try context.fetch(fetchRequest) as! [Detaildata]
//        } catch {
//            print("can not get data")
//        }
//        return detaildata
//    }
//
//    func deleteFilmDetailData(index:Int) -> [Detaildata]{
//        var detaildata = getFilmDetailData()
//        context.delete(detaildata[index])
//        detaildata.remove(at: index)
//        do{
//            try context.save()
//        } catch {
//            print("can not delete data")
//        }
//        return detaildata
//    }
//
////    func movetoFinishDetailData(index:Int) -> [Detaildata]{
////
////    }
//}
