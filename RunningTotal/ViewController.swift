//
//  ViewController.swift
//  RunningTotal
//
//  Created by Admin on 7/12/19.
//  Copyright © 2019 Lalit. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    let cellReuseIdentifier = "cell"
    let obj = Data()
    var temp = [Int]()
    @IBOutlet weak var txtfield: UITextField!
    
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var resultlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          self.tblview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tblview.delegate = self
        tblview.dataSource = self
       
        
        let ref = Database.database().reference().child("uid_0").child("NUMBERS")
        ref.observe(.childAdded){ (snapshot) in
            
            self.obj.Array.append(snapshot.value as! Int)
            
            print(self.obj.Array)
            self.updatetotal()
           self.tblview.reloadData()

            
            
        }
        
     // print(temp)
        
        
        
        
        
        
        
    }


    @IBAction func addbtn(_ sender: Any) {

    
        obj.add(x: Int(txtfield.text ?? "0") ?? 0)
        //updatetotal()
        txtfield.text?.removeAll()
          //      tblview.reloadData()
    }
    
    
    func updatetotal() {
        let x = obj.total()
        resultlabel.text = "Running Total : \(x)"
         tblview.reloadData()
        
    }
    
    @IBAction func clrbtn(_ sender: Any) {
        obj.removeall()
       updatetotal()
        txtfield.text?.removeAll()
         tblview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj.arrcnt()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:UITableViewCell = (self.tblview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        
        // set the text from the data model
        cell.textLabel?.text = String(obj.Array[indexPath.row])
       
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == .delete)
        {
            
            obj.delete(x: indexPath.row)
            updatetotal()
            tblview.reloadData()
        }
        
        
    }
    
    
    
    
    
}

