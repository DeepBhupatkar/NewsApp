//
//  ContentView.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = NewsViewModel()
    @State private var changeCountry = false
    var body: some View {
        
        NavigationView {
            ZStack {

                VStack{
                    if !viewModel.isLoading {
                        HStack{
                            Text("\(viewModel.country.flag) \(viewModel.country.name)")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Button{
                                changeCountry = true
                            } label:{
                                Text("Change")
                            }
                        }
                        .padding(.horizontal)
                    }
                    if #available(iOS 17.2, *){
                        NewsListView(articles: viewModel.articles)
                            .task {
                                viewModel.getNews()
                            }
                            .refreshable {
                                viewModel.incrementPage()
                                viewModel.getNews()
                            }
                    } else{
                        NewsListView(articles: viewModel.articles)
                        
                        .onAppear{
                            viewModel.getNews()
                        }
                    }
                }
                .sheet(isPresented: $changeCountry) {
                    viewModel.articles = []
                    viewModel.getNews()
                } content:{
                    CountryListView(country: $viewModel.country)
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
