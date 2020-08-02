//
//  mainINGViewController.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit
import CoreData

class mainINGViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var owners: [Projectdata] = []
    
    @IBOutlet weak var projectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectTableView.delegate = self
        projectTableView.dataSource = self
        self.projectTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Projectdata> = Projectdata.fetchRequest()

        do {
            owners = try managedContext.fetch(fetchRequest)
            self.projectTableView.reloadData()
        }catch{
            print("cant get data")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
        let selectedRow = self.projectTableView.indexPathForSelectedRow?.row else {
            return
        }
        destination.owner = owners[selectedRow]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
}
