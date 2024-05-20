//
//  News.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation

//creating the model for news featching with properties from the api json
struct News: Codable {
    struct Article: Codable {
        struct Source: Codable {
            let name: String
        }
        let source: Source
        let author: String?
        let title: String
        let description: String?
        let url: URL
        let urlToImage: URL?
        let publishedAt: Date
    }
    let articles: [Article]
    let totalResults: Int
}
