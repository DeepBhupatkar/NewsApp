//
//  Constants.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation

// https://newsapi.org/v2/top-headlines?country=us&apiKey=0d49dca934544b06b42020d61ccae496
enum Constants{
    
    //till question mark in URL
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    //country value
    static let country = "us"
    //API Key
    static let apiKey = "YOURAPIKEY"
    //Comnination with Endpoints for string URL
    static var endPoint: String {
        Self.baseURL + "?country=" + Self.country + "&apiKey="
        + Self.apiKey 
    }
}
