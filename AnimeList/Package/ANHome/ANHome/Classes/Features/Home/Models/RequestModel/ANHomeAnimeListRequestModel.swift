//
//  ANHomeAnimeListRequestModel.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

struct ANHomeAnimeListRequestModel: Request {
    let base = "https://api.jikan.moe/v4/anime"
    let method: RequestMethod = .GET
    
    var url: URL { URL(string: base)! }
    var urlRequester: URLRequest { URLRequest(url: url) }
}
