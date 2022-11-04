//
//  Source.swift
//  News
//
//  Created by Osman Murat Haslak on 3.11.2022.
//

import Foundation

class Source: Codable {
    var id : String?
    var name: String?
    
    init(){
    }
    
    init(id:String,name:String){
        self.id = id
        self.name = name
    }
    
}
