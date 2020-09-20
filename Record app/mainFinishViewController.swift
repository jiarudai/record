//
//  mainFinishViewController.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class mainFinishViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var FinishTableView: UITableView!
    var owners: [Projectdata] = []
//        {
//            didSet{
//                print("finish value:\(String(describing: owners))")
//            }
//    
//        }
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FinishTableView.delegate = self
        self.FinishTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Projectdata> = Projectdata.fetchRequest()
        let preicate = NSPredicate(format: "isexpiry = %@" , "expiry" )
        fetchRequest.predicate = preicate

        do {
            owners = try managedContext.fetch(fetchRequest)
            self.FinishTableView.reloadData()
        }catch{
            print("cant get data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,let selectedRow = self.FinishTableView.indexPathForSelectedRow?.row else {
            return
        }
        destination.owner = owners[selectedRow]
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainFinishTableViewCell", for: indexPath) as! mainFinishTableViewCell
        
        let projectdatas = owners[indexPath.row]
        
        cell.lblfinishcreatetime.text = projectdatas.createfiletime
        cell.lblfinishcameraname.text = projectdatas.cameraname
        cell.lblfinishfilmbrand.text = projectdatas.filmbrand
        cell.lblfinishfilname.text = projectdatas.filmname
        cell.lblfinishfilmiso.text = projectdatas.filmiso
        cell.lblfinishfilmexpiry.text = projectdatas.isexpiry
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FinishDetailViewController", sender: self)
    }
}

