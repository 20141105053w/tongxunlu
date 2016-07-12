//
//  find.swift
//  tongxunlu
//
//  Created by 20141105053w on 16/7/11.
//  Copyright © 2016年 20141105053w. All rights reserved.
//

import UIKit

class find: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var yy: UITextField!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    @IBAction func find(sender: AnyObject) {
        sele()
        
    }
    
    func sele(){
        let v = yy.text!
            yy.text!=""
        let data = db.query("select * from user where mobile='\(v)'")
        for (var i=0;i<data.count;i++)
            
        {
            let user=data[i]
            yy.text! += "  name： " + String(user["name"]!) + "  phone: " + String(user["mobile"]!) + "   address: " + String(user["address"]!)+"  email: " + String(user["email"]!) + "\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}