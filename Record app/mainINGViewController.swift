//
//  mainINGViewController.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class mainINGViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,mainINGTableViewDelegate {

    var owners: [Projectdata] = []
    {
        didSet{
            print("ing value:\(String(describing: owners))")
        }
        
    }
    
    @IBOutlet weak var projectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectTableView.delegate = self
        projectTableView.dataSource = self
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
        let preicate = NSPredicate(format: "isCheckFinish = %@" , "0" )
        fetchRequest.predicate = preicate

        do {
            owners = try managedContext.fetch(fetchRequest)
            self.projectTableView.reloadData()
        }catch{
            print("cant get data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,let selectedRow = self.projectTableView.indexPathForSelectedRow?.row else {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainINGTableViewCell", for: indexPath) as! mainINGTableViewCell
        
        let projectdatas = owners[indexPath.row]
        
        cell.Lblcreatetime.text = projectdatas.createfiletime
        cell.Lblcameraname.text = projectdatas.cameraname
        cell.Lblfilmbrand.text = projectdatas.filmbrand
        cell.Lblfilmname.text = projectdatas.filmname
        cell.Lblfilmiso.text = projectdatas.filmiso
        cell.Lblisexpiry.text = projectdatas.isexpiry
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewController", sender: self)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            owners = Projectdatabase.shareInstance.deleteFilmProjectData(index: indexPath.row)
            self.projectTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func BtnAddProjectName(_ sender: Any) {
        let addprojectVC = self.storyboard?.instantiateViewController(withIdentifier: "AddProjectViewController") as! AddProjectViewController
        self.navigationController?.pushViewController(addprojectVC, animated: true)
        
    }
    
    func mainINGTableViewCellDidFinishStatus(_ sender: mainINGTableViewCell) {
        
        print("sender值：",sender)
        
        let alert = UIAlertController(title: "確定已完成此項目", message: "確認後將此項目移至Finish Tab.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "確認", style: .default) { (_) in
            
            let projectdata = self.owners[sender.tag]
            projectdata.isCheckFinish = true
            
            self.owners.remove(at: sender.tag)
            self.projectTableView.reloadData()
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert,animated: true, completion: nil)
    }
}

