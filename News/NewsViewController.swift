//
//  ViewController.swift
//  News
//
//  Created by Osman Murat Haslak on 3.11.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var newsCountry:String?
    var newsListe = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getAllNews()
    }
    
    func getAllNews(){
        
        AF.request("https://newsapi.org/v2/top-headlines?country=\(newsCountry!)&apiKey=yourApi",method: .get).response { response in
            
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(ArticlesCevap.self, from: data)
                    if let gelenHaberListesi = cevap.articles {
                        self.newsListe = gelenHaberListesi
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    @IBAction func info(_ sender: Any) {
        let ac = UIAlertController(title: "Info", message: "Haber Adeti: \(newsListe.count)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Tamam", style: .default))
        present(ac, animated: true)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let targetVC = segue.destination as! DetailsViewController
        targetVC.news = newsListe[indeks!]
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = newsListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucre", for: indexPath) as! TableViewCell
        cell.title.text = news.author
        cell.label.text = news.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"toDetail" , sender: indexPath.row)
    }
    
}

