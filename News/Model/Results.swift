//
//  Results.swift
//  News
//
//  Created by k u r i s u on 3/31/22.
//

import Foundation

struct Results: Codable {
    let NRes: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case NRes = "num_results"
        case results
    }
    
}

struct Result: Codable{
    let title: String
    let abstract: String
    let byline: String
    let publishedDate: String
    
    enum CodingKeys: String, CodingKey{
        case publishedDate = "published_date"
        case byline, title, abstract
    }
}
