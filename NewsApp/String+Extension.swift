//
//  String+Extension.swift
//  NewsApp
//
//  Created by DEEP BHUPATKAR on 20/05/24.
//

import Foundation

extension String {
    var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options:
    .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
    "", options:.regularExpression, range: nil)
    }
}
