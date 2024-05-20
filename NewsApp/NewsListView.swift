//
//  NewsListView.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import SwiftUI

struct NewsListView: View {
    let articles: [ArticleViewModel]
    var body: some View {
        List(articles)
        {article in
            VStack(alignment:.leading)
            {
                Group{
                    Text(article.source).fontWeight(.bold)
                    Text(article.author)
                    Text(article.date)
                }.font(.caption)
                Text(article.title).fontWeight(.bold)
                Text(article.description)
                    .foregroundStyle(Color.secondary)
                
                HStack{
                    Spacer()
                    Link(destination: article.url, label: {
                        Image(systemName: "location.square")
                            .font(.system(size: 36))
                            .foregroundColor(.blue)
                            
                            
                    })
                    .buttonStyle(PlainButtonStyle())
                }

                
//                if #available(iOS 15, *){
//                    if article.image != nil{
//                    AsyncImageList(url: article.imageURL) { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                    } placeholder: {
//                        ProgressView()
//                    }
//
//                }
//                }
//                else {
                    if let image  = article.image{
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
//                }
                
            }
        }
    }
}

