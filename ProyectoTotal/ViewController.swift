//
//  ViewController.swift
//  ProyectoTotal
//
//  Created by Loquat Solutions on 21/6/17.
//  Copyright © 2017 MHP. All rights reserved.
//

import UIKit





import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Milk", "Honey", "Bread", "Tacos", "Tomatoes"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
   
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath:       IndexPath) {
    
             print("You selected cell number: \(indexPath.row)!");
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    let miVistaDos = storyBoard.instantiateViewController(withIdentifier: "vistaDos") as! ViewControllerDos
    
    self.present(miVistaDos, animated:true, completion:nil)
    
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

