//
//  ViewController.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 27/03/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Referencias UI

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        //1. Obtener los valores de los TextField
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jorge@gmail.com", password == "123" {
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("Credenciales invalidas")
        }
        
    }
    
}

