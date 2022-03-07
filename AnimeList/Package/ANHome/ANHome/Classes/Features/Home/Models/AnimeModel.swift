//
//  AnimeModel.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

import Foundation

class AnimeModel {
    
    private let response: ANHomeAnimeDataResponseModel
    
    init(response: ANHomeAnimeDataResponseModel) {
        self.response = response
    }
    
    var animeName: String {
        response.animeName
    }
    
    var image: UIImage?
}
