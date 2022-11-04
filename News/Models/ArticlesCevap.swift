//
//  AritclesCevap.swift
//  News
//
//  Created by Osman Murat Haslak on 3.11.2022.
//

import Foundation

class ArticlesCevap: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
}
