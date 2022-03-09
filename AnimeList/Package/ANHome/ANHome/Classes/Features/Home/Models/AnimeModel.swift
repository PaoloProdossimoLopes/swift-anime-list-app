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
        self.image = giveImage()
    }
    
    convenience init(response: ANHomeAnimeDataResponseModel, image: UIImage?) {
        self.init(response: response)
        self.image = image
    }
    
    var animeName: String {
        response.animeName
    }
    
    var image: UIImage?
    
    private func giveImage() -> UIImage? {
        guard let url = URL(string: response.image.jpeg.smallImageURLString),
              let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
}
