//
//  DillerViewController.swift
//  News
//
//  Created by Osman Murat Haslak on 4.11.2022.
//

import UIKit

class DillerViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var diller = [String]()
    var country = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        diller = ["Turkey","United Kingdom","Argentina","Australia","Belgium","France","Germany","Hong Kong","Japan"]
        country = ["tr","gb","ar","au","be","fr","de","hk","jp",]


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let targetVC = segue.destination as! ViewController
        targetVC.newsCountry = country[indeks!]
    }
    

}

extension DillerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucre", for: indexPath) as! DillerTableViewCell
        cell.label.text = diller[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toNews", sender: indexPath.row)
    }
    
}
