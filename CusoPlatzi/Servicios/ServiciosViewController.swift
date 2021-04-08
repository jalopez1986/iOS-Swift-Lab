//
//  ServiciosViewController.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 28/03/21.
//

import UIKit
import Alamofire


//Convirtiendo JSON a modelo
//1. Crear modelo Codable
//2. Utilizar JSONDecoder para serializar Data a Modelo

struct Human: Codable {  //Codable disponible desde Swift4
    let user: String
    let age: Int
    let isHappy: Bool
}




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
        
        AF.request(endpoint, method: .get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            
            if (response.error != nil) {
                print("hubo un error")
                return
            }
            
            guard
                let dataFromService = response.data,
                let model: Human = try? JSONDecoder().decode(Human.self, from: dataFromService) else {
                return
            }
            
            //Importante: Todos los llamados a la UI se hacen en el main thread
            DispatchQueue.main.async {
                self.nameLabel.text = model.user
                self.statusLabel.text = model.isHappy ? "Es feliz!" : "Es triste!"
            }
            
        }
    }
    


}
