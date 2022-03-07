//
//  ANHomeRecomendedAnimesRequestModel.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

struct ANHomeRecomendedAnimesRequestModel: Request {
    let url: URL = .init(string: "https://api.jikan.moe/v4/recommendations/anime")!
    let method: RequestMethod = .GET
    
    var urlRequester: URLRequest { URLRequest(url: url) }
}
