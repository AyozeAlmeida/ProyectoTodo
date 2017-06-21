//
//  ViewDos.swift
//  ProyectoTotal
//
//  Created by Loquat Solutions on 21/6/17.
//  Copyright © 2017 MHP. All rights reserved.
//

import Foundation


import UIKit



class ViewControllerDos: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var boton: UIButton!
      @IBOutlet weak var tableView: UITableView!
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         boton.addTarget(self, action: #selector(ViewControllerDos.buttonPressed(sender:)) , for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if let myName = task.nombre {
            cell.textLabel?.text = myName
        }
        
        return cell
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonPressed(sender: AnyObject?){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let miVistaTres = storyBoard.instantiateViewController(withIdentifier: "vista3") as! ViewController3
        
        self.present(miVistaTres, animated:true, completion:nil)
        
    }
    func getData() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }}


