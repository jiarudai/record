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
    
    var owner: Projectdata?
//    {
//        didSet{
//            print("owner value:\(String(describing: owner))")
//        }
    
//    }
    
    @IBOutlet weak var detailtableView: UITableView!
    
    @IBOutlet weak var BtnadddataClick: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailtableView.dataSource = self
        detailtableView.delegate = self
//        print("viewDidLoad=" ,owner?.detaildata?.count)
        if owner?.detaildata?.count ?? 0 >= 5 {
            BtnadddataClick.isHidden = true
        }else{
            BtnadddataClick.isHidden = false
        }
        self.detailtableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("viewWillAppear=" ,owner?.detaildata?.count)
        if owner?.detaildata?.count ?? 0 >= 5 {
            BtnadddataClick.isHidden = true
        }else{
            BtnadddataClick.isHidden = false
        }
        self.detailtableView.reloadData()

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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return owner?.detaildata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if let detaildatas = owner?.detaildata?[indexPath.row] {
            cell.lblcreatepicturetime.text = detaildatas.createpicturetime
            cell.lblcameralens.text = detaildatas.cameralens
            cell.lbldiaphgram.text = detaildatas.diaphgram
            cell.lblshutter.text = detaildatas.shutter
            cell.lblfilter.text = detaildatas.filter
            if cell.imagephotolibrary.image == nil {
                cell.imagephotolibrary.image = UIImage(named: "detaildefaultimage")
            }
            if let image = detaildatas.uploadimage {
                DispatchQueue.main.async {
                    cell.imagephotolibrary.image = UIImage(data: image as Data)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didclickedImageView()
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteOwner(at: indexPath)
            detailtableView.reloadData()
        }
    }
    
    
    @IBAction func BtnaddDataClick(_ sender: Any) {
        let selectDataVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectDataViewController") as! SelectDataViewController
        selectDataVC.owner = self.owner
        self.navigationController?.pushViewController(selectDataVC, animated: true)
    }
    
    func deleteOwner(at indexPath: IndexPath) {
        guard let owners = owner?.detaildata?[indexPath.row],
            let managedContext = owners.managedObjectContext
            else {
                return
        }
        managedContext.delete(owners)

        do {
            try managedContext.save()
            detailtableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete it")
            detailtableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func didclickedImageView() {
        let imagePicker = UIImagePickerController()
        let isAvailable = UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        if isAvailable {
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
}

extension DetailViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:  [UIImagePickerController.InfoKey : Any] ) {
        
        guard let choseImage = info[.editedImage] as? UIImage else {
            return
        }

        let imageData = choseImage.pngData()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let detaildata = self.owner?.detaildata else {
            return
        }
        
        var isInsertNewData: Bool = true
        for detail in detaildata {
            if detail.uploadimage == nil {
                detail.uploadimage = imageData as NSData?
                isInsertNewData = false
                break
            }
        }
        if isInsertNewData {
            guard let detaildata = NSEntityDescription.insertNewObject(forEntityName: "Detaildata", into: context) as? Detaildata else {
                return
            }
            detaildata.uploadimage = imageData as NSData?
            owner?.addToCamName(detaildata)
        }
        
        appDelegate.saveContext()
        print("路徑 : ",NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).last!);
        
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}


