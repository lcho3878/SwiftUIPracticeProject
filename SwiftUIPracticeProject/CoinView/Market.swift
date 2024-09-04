//
//  Market.swift
//  SwiftUIPracticeProject
//
//  Created by 이찬호 on 9/4/24.
//

import Foundation

struct Market: Hashable, Codable {
    let id = UUID()
    let market, koreanName, englishName: String
    var star: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
