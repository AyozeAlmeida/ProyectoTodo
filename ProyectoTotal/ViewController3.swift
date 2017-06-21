//
//  ViewController3.swift
//  ProyectoTotal
//
//  Created by Loquat Solutions on 21/6/17.
//  Copyright © 2017 MHP. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class ViewController3: UIViewController{
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    boton3.addTarget(self, action: #selector(ViewController3.but(sender:)), for: .touchUpInside)
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    func but(sender:AnyObject?){
        print("se acabo por hoy")
        label.text = "se acabo por hoy"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.nombre = taskTextField.text!
        // Save the data to coredata
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let miVistaDos = storyBoard.instantiateViewController(withIdentifier: "vistaDos") as! ViewControllerDos
        
        self.present(miVistaDos, animated:true, completion:nil)
        
    }
}
