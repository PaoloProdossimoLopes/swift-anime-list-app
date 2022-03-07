//
//  ANHomeTopAnimesRequestModel.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

struct ANHomeTopAnimesRequestModel: Request {
    let url: URL = .init(string: "https://api.jikan.moe/v4/top/anime")!
    let method: RequestMethod = .GET
    
    var urlRequester: URLRequest { URLRequest(url: url) }
}
