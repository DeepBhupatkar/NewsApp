//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation
import UIKit

struct ArticleViewModel: Identifiable {
    //for present array in list view
    let article: News.Article
     init(article: News.Article) {
         self.article = article
     }
    static var dateFormatter : DateFormatter {
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    let id = UUID()
    var author : String{
        article.author?.withoutHtmlTags ?? ""
    }
    var url : URL{
        article.url
    }
    var source: String {
        article.source.name.withoutHtmlTags
    }
    var title:String {
        article.title.withoutHtmlTags
    }
    var description : String{
        article.description?.withoutHtmlTags ?? ""
    }
    var image: UIImage? {
        
        guard let imageURL = article.urlToImage else{ return nil}
        guard let data = try? Data(contentsOf: imageURL) else{ return nil}
        guard let image: UIImage = UIImage(data: data) else{ return nil}
        return image
    }
    
    var date: String{
        Self.dateFormatter.string(from: article.publishedAt)
    }
}
    
