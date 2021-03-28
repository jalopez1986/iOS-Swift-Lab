//
//  ViewController.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 27/03/21.
//

import UIKit
import PopupDialog


class ViewController: UIViewController {
    //MARK: Referencias UI

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    
    private let emailKey = "email-key"
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storedEmail = storage.string(forKey: emailKey) {
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn = false
        }
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        //1. Obtener los valores de los TextField
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if email == "jorge@gmail.com", password == "123" {
            if (emailSwitch.isOn) {
                storage.set(email,forKey: emailKey)
            } else {
                storage.removeObject(forKey: emailKey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
            
        } else {
            showErrorDialog()
        }
        
    }
    
    private func showErrorDialog() {
        // Prepare the popup assets
        let title = "Error"
        let message = "Credenciales inválidas"
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }


        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])

        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
}

