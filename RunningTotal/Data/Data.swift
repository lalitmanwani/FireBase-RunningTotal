//
//  Data.swift
//  RunningTotal
//
//  Created by Admin on 7/12/19.
//  Copyright © 2019 Lalit. All rights reserved.
//

import Firebase



class Data{
    
    var Array = [Int]()

    
    init() {
      //  Array = UserDefaults.standard.array(forKey: "num")as? [Int] ?? [Int]()
        //Array = getArray()
       /// print(Array)
        //getArray()
    }

    
    func add(x:Int){
        Array.append(x)
        //UserDefaults.standard.set(Array, forKey: "num")
        let ref = Database.database().reference().child("uid_0").child("NUMBERS")
        ref.setValue(Array)
        Array.remove(at: arrcnt() - 1)
    }
    
    
    func delete(x:Int){
        Array.remove(at: x)
        //UserDefaults.standard.set(Array, forKey: "num")
        //UserDefaults.standard.synchronize()
        let ref = Database.database().reference().child("uid_0").child("NUMBERS")
        ref.setValue(Array)
    }
    
    
    func total() -> Int {
        let totalSum = Array.reduce(0, +)
        return totalSum
    }
    
    
    func removeall() {
        Array.removeAll()
        //UserDefaults.standard.set(Array, forKey: "num")
        let ref = Database.database().reference().child("uid_0").child("NUMBERS")
        ref.setValue(Array)
    }
    
    func arrcnt() -> Int {
        return Array.count
    }
    
    
    
    func getArray(){
        let ref = Database.database().reference().child("uid_0").child("NUMBERS")
        ref.observe(.childAdded){ (snapshot) in
            
            let snapShotVal = snapshot.value as! Int

            print(snapShotVal)
            
            
        }
}


}


