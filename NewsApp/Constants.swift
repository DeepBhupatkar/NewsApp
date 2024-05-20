//
//  Constants.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation


enum Constants{
    
    //till question mark in URL
    static let baseURL = "https://newsapi.org/v2/top-headlines"
    //country value
    static let country = "in"
    //API Key
    static let apiKey = "YOURAPIKEY"
    //Comnination with Endpoints for string URL
    static var endPoint: String {
        Self.baseURL + "?country=" + Self.country + "&apiKey="
        + Self.apiKey 
    }
}
