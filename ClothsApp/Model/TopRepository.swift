//
//  TopRepository.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import Foundation

// MARK: - TopRepository
struct TopRepository: Codable {
    let mainStickyMenu: [MainStickyMenu]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case mainStickyMenu = "main_sticky_menu"
        case status, message
    }
}

// MARK: - MainStickyMenu
struct MainStickyMenu: Codable {
    let title: String
    let image: String
    let sortOrder: String
    let sliderImages: [MainStickyMenu]?
    let cta: String?

    enum CodingKeys: String, CodingKey {
        case title, image
        case sortOrder = "sort_order"
        case sliderImages = "slider_images"
        case cta
    }
}

