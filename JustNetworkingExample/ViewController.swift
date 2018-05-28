//
//  ViewController.swift
//  JustNetworkingExample
//
//  Created by  LaptopGCampos on 5/28/18.
//  Copyright © 2018 JustNetworking. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var films: [Film] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var api: API = {
        return API(requester: URLSession(configuration: .default))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilms()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = films[indexPath.row].title
        return cell ?? UITableViewCell()
    }
    
    func getFilms() {
        api.execute(StarWarsFilms.film([Film].self, for: .allFilms)) { result in
            switch result {
            case .success(let genericResult):
                DispatchQueue.main.async {
                    self.films = genericResult.results
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


