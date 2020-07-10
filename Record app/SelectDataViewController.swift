//
//  SelectDataViewController.swift
//  Record app
//
//  Created by Judy Dai on 2020/5/16.
//  Copyright © 2020 Judy Dai. All rights reserved.
//

import UIKit

class SelectDataViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var cameralensPickertxt: UITextField!
    @IBOutlet weak var diaphgramDataPickertxt: UITextField!
    @IBOutlet weak var shutterPickertxt: UITextField!
    @IBOutlet weak var filtertxt: UITextField!
    
    var owner: Projectdata?{
        didSet{
            print("owner(PROJECTDATA) value:\(String(describing: owner))")
        }
    }
    
    var Cameralens = ["20","50"]
    var Diaphragm = ["f/1.8","f/2.8"]
    var Shutter = ["2","5"]
    var activeDataArray = ""
    
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        picker.dataSource = self
        cameralensPickertxt.inputView = picker
        diaphgramDataPickertxt.inputView = picker
        shutterPickertxt.inputView = picker
        cameralensPickertxt.text = nil
        diaphgramDataPickertxt.text = nil
        shutterPickertxt.text = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if cameralensPickertxt.isFirstResponder{
            return Cameralens.count
        }else if diaphgramDataPickertxt.isFirstResponder{
            return Diaphragm.count
        }else if shutterPickertxt.isFirstResponder{
            return Shutter.count
            
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if cameralensPickertxt.isFirstResponder{
            let activeDataArray = Cameralens[row]
            cameralensPickertxt.text = activeDataArray
            picker.selectRow(0, inComponent: 0, animated: false)
        }else if diaphgramDataPickertxt.isFirstResponder{
            let activeDataArray = Diaphragm[row]
            diaphgramDataPickertxt.text = activeDataArray
            picker.selectRow(0, inComponent: 0, animated: false)
        }else if shutterPickertxt.isFirstResponder{
            let activeDataArray = Shutter[row]
            shutterPickertxt.text = activeDataArray
            picker.selectRow(0, inComponent: 0, animated: false)
        }
        self.view.endEditing(true)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if cameralensPickertxt.isFirstResponder{
            return Cameralens[row]
        }else if diaphgramDataPickertxt.isFirstResponder{
            return Diaphragm[row]
        }else if shutterPickertxt.isFirstResponder{
            return Shutter[row]
        }
        return nil
    }
    
    
    @IBAction func BtnSaveDataClick(_ sender: Any) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        let currenttime = formatter.string(from: date)
//        let dict = ["createpicturetime":currenttime,"cameralens":cameralensPickertxt.text ?? 0 ,"diaphgram":diaphgramDataPickertxt.text ?? 0,"shutter":shutterPickertxt.text ?? 0,"filter":filtertxt.text ?? 0] as [String : Any]
//        DatabaseHelper.shareInstance.save(object: dict as! [String : String])
        let createpicturetime = currenttime
        let cameralens = cameralensPickertxt.text ?? ""
        let diaphgram = diaphgramDataPickertxt.text ?? ""
        let shutter = shutterPickertxt.text ?? ""
        let filter = filtertxt.text ?? ""

        if let detaildatas = Detaildata(cameralens: cameralens, createpicturetime: createpicturetime, diaphgram: diaphgram, filter: filter, shutter: shutter) {
            owner?.addToCamName(detaildatas)
            print(owner ?? "OWNER值在哪")
            print(owner?.addToCamName(detaildatas) ?? "addtoCamName值？")
            
            do {
                try detaildatas.managedObjectContext?.save()
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("can't save it")
            }
            
        }
    }

    
    @IBAction func BtnShowDetailClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let picker = textField.inputView as? UIPickerView {
            picker.selectRow(0, inComponent: 0, animated: false)
        }
    }
}
