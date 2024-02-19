//
//  CategoryRepository.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import Foundation

// MARK: - CategoryRepository
struct CategoryRepository: Codable {
    let categories: [Category]
    let bannerImage: String
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case categories
        case bannerImage = "banner_image"
        case status, message
    }
}

// MARK: - Category
struct Category: Codable {
    let categoryID, categoryName, parentID: String
    let child: [Category]?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryName = "category_name"
        case parentID = "parent_id"
        case child
    }
}
