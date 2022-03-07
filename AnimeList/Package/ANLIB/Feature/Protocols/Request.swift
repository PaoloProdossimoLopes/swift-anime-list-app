//
//  Request.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

public protocol Request {
    var url: URL { get }
    var method: RequestMethod { get }
    var urlRequester: URLRequest { get }
}
