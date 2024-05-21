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
    @Published var country = Country.country(code: Constants.country)
    @Published var isLoading = false
    //for refresh
    @Published var totalResults = 0
    @Published var currentPage = 1
    
    // by defult in api is count = 20 so we can increase the count so we can get different one
    
    //below for calculating the number of pages we fetch by defult 20.
    
    var numPages : Int{
        (Double (totalResults / 20) == Double(totalResults) / 20.0) ? (totalResults / 20 ) : (totalResults / 20 ) + 1
    }
    
    //select the country endpoint value
    var countryEndpoint: String {
        Constants.baseURL + "?country=" + country.code + "&page=" + String(currentPage) + "&apiKey="
        + Constants.apiKey
    }
    
    
    //this below function incerement the count each time after the func getNews() called
    
    func incrementPage(){
        currentPage = (currentPage == numPages) ? 1 : currentPage + 1
    }
    
    
    //getNews Fuction is called APIService getJson
    func getNews(){
        isLoading = true
        if #available(iOS 15, *) {
                  Task.init {
                      do {
                          let news:News = try await APIService.shared.getJSON(urlString: countryEndpoint, dateDecodingStrategy: .iso8601)
                          articles = news.articles.map(ArticleViewModel.init)
                          totalResults = news.totalResults
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
                    self.isLoading = false
                }
            }
        }
        
    }
    
}
