//
//  CountryListView.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 21/05/24.
//

import SwiftUI

struct CountryListView: View {

    @Environment (\.presentationMode) var presentationMode
    @Binding var country: Country
    var body: some View {
        List(Country.countries) {
            country in HStack{
                Text("\(country.flag) \(country.name)")
                Spacer()
            }.contentShape(Rectangle())
                .onTapGesture {
                    self.country = country
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}


