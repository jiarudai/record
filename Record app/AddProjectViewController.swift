//
//  AddProjectViewController.swift
//  🐷
//
//  Created by Judy Dai on 2020/5/24.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var selectprojectdataSegementController: UISegmentedControl!
    
    @IBOutlet weak var selectprojectdataTableView: UITableView!
    
    let camera = ["12345678","3333","你是豬"]
    let filmbrand = ["ABCDEW","LOKKFEK","adfggff"]
    let filmname = ["abc","efg","def"]
    let filmiso = ["100","200","300"]
    let isexpiry = ["expiry","unexpiry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectprojectdataTableView.delegate = self
        selectprojectdataTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectprojectdataSegementController.selectedSegmentIndex {
        case 0:
            return camera.count
        case 1:
            return filmbrand.count
        case 2:
            return filmname.count
        case 3:
            return filmiso.count
        case 4:
            return isexpiry.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectProjectDataTableViewCell", for: indexPath) as! SelectProjectDataTableViewCell
        switch selectprojectdataSegementController.selectedSegmentIndex {
        case 0:
            cell.Lbldata.text = camera[indexPath.row]
        case 1:
            cell.Lbldata.text = filmbrand[indexPath.row]
        case 2:
            cell.Lbldata.text = filmname[indexPath.row]
        case 3:
            cell.Lbldata.text = filmiso[indexPath.row]
        case 4:
            cell.Lbldata.text = isexpiry[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectprojectdataSegementController.selectedSegmentIndex {
        case 0:
            self.updateSegmentControl(to: 1)
        case 1:
            self.updateSegmentControl(to: 2)
        case 2:
            self.updateSegmentControl(to: 3)
        case 3:
            self.updateSegmentControl(to: 4)
        case 4:
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            let currenttime = formatter.string(from: date)
            let dict = ["createfiletime":currenttime, "cameraname":camera[indexPath.row], "filmbrand":filmbrand[indexPath.row], "filmname":filmname[indexPath.row], "filmiso":filmiso[indexPath.row], "isexpiry":isexpiry[indexPath.row]]
            Projectdatabase.shareInstance.save(object: dict)
            
            self.navigationController?.popToRootViewController(animated: true)
        default:
            break
        }
    }
    
    
    func updateSegmentControl(to idx: Int) {
        self.selectprojectdataSegementController.selectedSegmentIndex = idx
        self.selectprojectdataTableView.reloadData()
    }
    
    @IBAction func segementChange(_ sender: Any) {
        selectprojectdataTableView.reloadData()
    }
    
}
