//
//  DetailViewController.swift
//  Record app
//
//  Created by Judy Dai on 2020/5/16.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var detaildata = [Detaildata]()
//    var detaildatas: [Detaildata] = []
    
    var owner: Projectdata?
    {
        didSet{
            print("owner value:\(String(describing: owner))")
        }

    }
    
    @IBOutlet weak var detailtableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        detaildata = DatabaseHelper.shareInstance.getFilmDetailData()
        detailtableView.dataSource = self
        detailtableView.delegate = self
        self.detailtableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        detaildata = DatabaseHelper.shareInstance.getFilmDetailData()
        self.detailtableView.reloadData()
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<Detaildata> = Detaildata.fetchRequest()
//
//        do {
//            detaildata = try managedContext.fetch(fetchRequest)
//            self.detailtableView.reloadData()
//        }catch{
//            print("cant get data")
//        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? SelectDataViewController else {
            return
        }

        destination.owner = owner
        print(destination.owner ?? "123")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("projectdata的detaildata", owner?.detaildata?.count ?? "吼呦出來")
        return owner?.detaildata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//        let detaildatas = detaildata[indexPath.row]
        if let detaildatas = owner?.detaildata?[indexPath.row] {
            cell.lblcreatepicturetime.text = detaildatas.createpicturetime
            cell.lblcameralens.text = detaildatas.cameralens
            cell.lbldiaphgram.text = detaildatas.diaphgram
            cell.lblshutter.text = detaildatas.shutter
            cell.lblfilter.text = detaildatas.filter
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SelectDataDetailViewController", sender: self)
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            detaildata = DatabaseHelper.shareInstance.deleteFilmDetailData(index: indexPath.row)
//            self.detailtableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
    
    @IBAction func BtnaddDataClick(_ sender: Any) {
        let selectDataVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectDataViewController") as! SelectDataViewController
        selectDataVC.owner = self.owner
        self.navigationController?.pushViewController(selectDataVC, animated: true)
    }
    
}
