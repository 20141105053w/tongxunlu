//
//  zhaoren.swift
//  tongxunlu
//
//  Created by 20141105053w on 16/7/11.
//  Copyright © 2016年 20141105053w. All rights reserved.
//


import UIKit
class zhaoren:UIViewController {
    
    @IBOutlet var p: UITextView!
    @IBOutlet var a: UITextField!
    var db:SQLiteDB!

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    db = SQLiteDB.sharedInstance()
    //如果表还不存在则创建表（其中uid为自增主键）
    db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
}


    @IBAction func zhao(sender: AnyObject) {
        find()
    }

func find(){
    let s=a.text!
    let data = db.query("select * from user where uname='\(s)'")
    for(var i=0;i<data.count;i++)
    {
        //获取最后一行数据显示
        let u = data[i]
        p.text! += " phone: "+String(u["mobile"]!)+"\n"+" address: "+String(u["address"]!)+"\n"+" email: "+String(u["email"]!)+"\n"
    }
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
}
}