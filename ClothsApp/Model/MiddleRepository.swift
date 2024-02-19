//
//  MiddleRepository.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import Foundation

// MARK: - MiddleRepository
struct MiddleRepository: Codable {
    let shopByCategory, shopByFabric: [ShopBy]
    let unstitched: [Unstitched]
    let boutiqueCollection: [BoutiqueCollection]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case shopByCategory = "shop_by_category"
        case shopByFabric = "shop_by_fabric"
        case unstitched = "Unstitched"
        case boutiqueCollection = "boutique_collection"
        case status, message
    }
}

// MARK: - BoutiqueCollection
struct BoutiqueCollection: Codable {
    let bannerImage: String
    let name, cta, bannerID: String

    enum CodingKeys: String, CodingKey {
        case bannerImage = "banner_image"
        case name, cta
        case bannerID = "banner_id"
    }
}

// MARK: - ShopBy
struct ShopBy: Codable {
    let categoryID: String?
    let name: String
    let tintColor: TintColor
    let image: String
    let sortOrder: String
    let fabricID: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case tintColor = "tint_color"
        case image
        case sortOrder = "sort_order"
        case fabricID = "fabric_id"
    }
}

enum TintColor: String, Codable {
    case ccccff = "#ccccff"
    case ccffcc = "#ccffcc"
    case ffb3B3 = "#ffb3b3"
}

// MARK: - Unstitched
struct Unstitched: Codable {
    let rangeID, name, description: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case rangeID = "range_id"
        case name, description, image
    }
}

