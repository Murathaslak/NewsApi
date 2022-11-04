//
//  Articles.swift
//  News
//
//  Created by Osman Murat Haslak on 3.11.2022.
//

import Foundation

class Articles: Codable {
    
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    init(){
        
    }
    
    init(source: Source,author: String,title: String,description: String,url: String,urlToImage: String,publishedAt: String,content: String){
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    
}
