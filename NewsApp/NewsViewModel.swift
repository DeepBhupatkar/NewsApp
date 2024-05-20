//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation

//ObservableObject Protocol

class NewsViewModel : ObservableObject{
    @Published var articles: [ArticleViewModel] = []
    @Published var isLoading = false
    
    
    //getNews Fuction is called APIService getJson
    
    func getNews(){
        isLoading = true
        if #available(iOS 15, *) {
                  Task.init {
                      do {
                          let news:News = try await APIService.shared.getJSON(urlString: Constants.endPoint, dateDecodingStrategy: .iso8601)
                          articles = news.articles.map(ArticleViewModel.init)
                     
                          isLoading = false
                      } catch {
                          print(error.localizedDescription)
                          isLoading = false
                      }
                  }

              }
        else {
            APIService.shared.getJSON(urlString: Constants.endPoint ,dateDecodingStrategy: .iso8601)
            {
                (result: Result<News,APIService.APIError>)
                in switch result{
                case .success(let news):
                    DispatchQueue.main.async{
                        self.articles = news.articles.map(ArticleViewModel.init)
                        self.isLoading = false
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
