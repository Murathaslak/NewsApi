//
//  DetailsViewController.swift
//  News
//
//  Created by Osman Murat Haslak on 4.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var detailsDate: UILabel!
    @IBOutlet var detailsImageView: UIImageView!
    @IBOutlet var detailsTitle: UILabel!
    @IBOutlet var detailsContent: UILabel!
    
    var news: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsTitle.text = news?.title
        detailsContent.text = news?.description
        detailsDate.text = news?.publishedAt
        
        if let url = URL(string: "\(news!.urlToImage!)"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.detailsImageView.image = UIImage(data: data!)
                }
            }
        }
        
        }



}
    


