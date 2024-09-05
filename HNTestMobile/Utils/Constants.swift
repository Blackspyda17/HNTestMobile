//
//  Constants.swift
//  HNTestMobile
//
//  Created by Gilberth Paez Ortiz on 5/9/24.
//

import Foundation
enum Constants {
    enum URLConstant {
        static let baseURL = "https://hn.algolia.com/api/v1/search_by_date?query=mobile"
    }
    
    enum HomeConstants {
        static let offlineTitle = "Offline Mode: Viewing Saved Articles Offline"
        static let navBarTitle =  "Articles"
        static let loadingText = "Loading..."
    }
    
    enum ArticleItemConstants {
        static let unKnownAuthorString = "Unknown author"
        static let hyphen = "-"
    }
}
