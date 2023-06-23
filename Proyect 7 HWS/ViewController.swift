//
//  ViewController.swift
//  Proyect 7 HWS
//
//  Created by Sabrina Ayala on 08/05/2023.
//


//Estaremos aprendiendo acerca de UITabBarController

import UIKit

class ViewController: UITableViewController {
    
    //custom type
    var petitions = [Petition]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Créditos", style: .plain, target: self, action: #selector(showCredits))
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
          urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=100008&limit=100"
        }
        
        //En vez de forzarla, la convertimos
        if let url = URL(string: urlString) {
            //obtener de la api, mejor usar "try" en caso de que tire "error"
           // convertir este url en instancia de datos
            if let data = try? Data(contentsOf: url) {
                //we are OK to parse data
                parse(json: data)
                return
              }
                
            }
        
        showError()
        
    }
    
    func showError(){
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    //descargando JSON con tipo de datos (DATA type)
    func parse(json: Data) {
        //new instance
        let decoder = JSONDecoder()
        
        //encuentra este tipo y hazlo un objeto
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    // la funcion que presenta la alerta siempre con OBJC
    @objc func showCredits() {
        let alert = UIAlertController(title: "Créditos", message: "Los datos provienen de We the people API of the white house", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

  
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        //Title
        cell.textLabel?.text = petition.title
        //Subtitle
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    // nuevo ViewController directamente sin utilizar un storyboard conectado a la clase DetailVie...
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        //lo que queremos cargar a la View
        vc.detailItem = petitions[indexPath.row]
        //traerlo a la pantalla
        navigationController?.pushViewController(vc, animated:true)
    }
    
}
