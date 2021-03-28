//
//  TableViewController.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 27/03/21.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [
    "@jlopez",
    "@caro",
    "@sebas",
    "@santio",
    "@messi",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        
        tableView.delegate = self
        
    }

}

extension TableViewController: UITableViewDataSource {
    //1. Numero de filas que tendra nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //2. Metodo para saber que celdas debe mostrarse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        (cell as? TweetTableViewCell)?.setupCell(username: dataSource[indexPath.row ], message: "Soy un tweet")
        
        //linea anterior pero haciendo uso de let
        /*if let newCell = cell as? TweetTableViewCell {
            newCell.setupCell(username: "@usuario\(indexPath.row)", message: "Soy un tweet")
        }*/
        
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fue seleccionada.")
    }
}
