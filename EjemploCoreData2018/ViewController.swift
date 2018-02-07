//
//  ViewController.swift
//  EjemploCoreData2018
//
//  Created by Jorge Cisneros on 5/2/18.
//  Copyright © 2018 Jorge Cisneros. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func cancelar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func guardar(_ sender: Any) {
        let _nombreMascota = self.nombreMascota.text!

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidad = NSEntityDescription.entity(forEntityName: "Mascota", in: managedContext)
        
        let registro = NSManagedObject(entity: entidad!, insertInto: managedContext)
        
        registro.setValue(_nombreMascota, forKey: "nombre")
        
        do{
            try managedContext.save()
            print("gato guardado ok")
        }   catch let error as NSError{
            print("No se ha podido escribir el gato \(error), \(error.userInfo)")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var nombreMascota: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

