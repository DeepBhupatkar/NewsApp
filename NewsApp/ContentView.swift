//
//  ContentView.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NewsViewModel()
    var body: some View {
        
        NavigationView {
            ZStack {
                if #available(iOS 17.2, *){
                    NewsListView(articles: viewModel.articles)
                        .task {
                            viewModel.getNews()
                        }
                } else{
                    NewsListView(articles: viewModel.articles)
                    
                    .onAppear{
                        viewModel.getNews()
                    }
                }
                
                if viewModel.isLoading{
                    ProgressView("Fetching the News")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                        .shadow(radius: 12)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("Top News")
        }
    }
    
}


#Preview {
    ContentView()
}
