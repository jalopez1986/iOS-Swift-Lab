//
//  ServiciosViewController.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 28/03/21.
//

import UIKit

class ServiciosViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchServices()
        

    }
    
    // Endpoint: http://www.mocky.io/v2/5e2674472f00002800a4f417
    // 1. Crear excepcion de seguridad.  //se hace en el info.plist
    // 2. Crear URL con el endpoint
    // 3. Hacer request con la ayuda de URLSession
    // 4. Transformar respuesta a diccionario
    // 5. Ejecutar request
    private func fetchServices() {
        let endpointString = "http://www.mocky.io/v2/5e2674472f00002800a4f417"
        
        guard let endpoint = URL(string: endpointString) else {
            return
        }
        
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: endpoint) { (data: Data?, _, error: Error?) in
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            
            if (error != nil) {
                print("hubo un error")
                return
            }
            
            guard let dataFromService = data,
                  let dictionary = try? JSONSerialization.jsonObject(with: dataFromService, options: []) as? [String: Any] else {
                return
            }
            
            //Importante: Todos los llamados a la UI se hacen en el main thread
            DispatchQueue.main.async {
                let isHappy = dictionary["isHappy"] as? Bool ?? false
                
                self.nameLabel.text = dictionary["user"] as? String
                self.statusLabel.text = isHappy ? "Es feliz!" : "Es triste!"
            }

        }.resume()
    }
    


}
