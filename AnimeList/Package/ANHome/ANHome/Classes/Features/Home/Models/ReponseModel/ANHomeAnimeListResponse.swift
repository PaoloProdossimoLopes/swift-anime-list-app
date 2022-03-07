//
//  ANHomeAnimeListResponse.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import Foundation

struct ANHomeAnimeListResponse: Codable {
    let pagination: ANHomePaginationResponseModel
    let animeDataList: [ANHomeAnimeDataResponseModel]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case animeDataList = "data"
    }
}

struct ANHomePaginationResponseModel: Codable {
    let lastPage: Int
    let hasNextPage: Bool
    
    enum CodingKeys: String, CodingKey {
        case lastPage = "last_visible_page"
        case hasNextPage = "has_next_page"
    }
}

struct ANHomeAnimeDataResponseModel: Codable {
    let id: Int
    let animeName: String
    let image: ANHomeAnimeImageResponseModel
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case animeName = "title"
        case image = "images"
    }
}

struct ANHomeAnimeImageResponseModel: Codable {
    let jpeg: ANHomeAnimeImageSizesResponseModel
    
    enum CodingKeys: String, CodingKey {
        case jpeg = "jpg"
    }
}

struct ANHomeAnimeImageSizesResponseModel: Codable {
    let urlImageString: String
    let smallImageURLString: String
    let largeImageURLString: String
    
    enum CodingKeys: String, CodingKey {
        case urlImageString = "image_url"
        case smallImageURLString = "small_image_url"
        case largeImageURLString = "large_image_url"
    }
}


