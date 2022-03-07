//
//  ServiceErrors.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

public enum ServiceErrors: Int, Error {
    case decodeError = -1
    case `unknow` = 0
    case notModified = 304
    case badRequest = 400
    case notFound = 404
    case methodNotAllow = 405
    case tooManyRequests = 429
    case internalServerError = 500
    case serviceUnavailable = 503
    
    var descirbeTheError: String {
        switch self {
            case .decodeError: return "Error when try to decode data"
        case .unknow:
            return "Error is unknow, plese check the class"
        case .notModified:
            return "You have the latest data (Cache Validation response)"
        case .badRequest:
            return "You've made an invalid request. Recheck documentation"
        case .notFound:
            return "The resource was not found or MyAnimeList responded with a 404"
        case .methodNotAllow:
            return "Requested Method is not supported for resource. Only GET requests are allowed"
        case .tooManyRequests:
            return "You are being rate limited by Jikan or MyAnimeList is rate-limiting our servers (specified in the error response)"
        case .internalServerError:
            return "Something is not working on our end. If you see an error response with a report_url URL, please click on it to open an auto-generated GitHub issue"
        case .serviceUnavailable:
            return "The service has broke."
        }
    }
    
    public func describeError() { print(descirbeTheError) }
}
