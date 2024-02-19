//
//  BottomRepository.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import Foundation

// MARK: - BottomRepository
struct BottomRepository: Codable {
    let rangeOfPattern: [RangeOfPattern]
    let designOccasion: [DesignOccasion]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case rangeOfPattern = "range_of_pattern"
        case designOccasion = "design_occasion"
        case status, message
    }
}

// MARK: - DesignOccasion
struct DesignOccasion: Codable {
    let productID, name: String
    let image: String
    let subName, cta: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, image
        case subName = "sub_name"
        case cta
    }
}

// MARK: - RangeOfPattern
struct RangeOfPattern: Codable {
    let productID: String
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case image, name
    }
}

