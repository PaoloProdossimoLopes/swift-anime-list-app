//
//  HomeService.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import Foundation

protocol HomeServiceProtocol {
    func executeRequest(
        _ which: HomeService.WhichRequest,
        completion: @escaping (Result<[AnimeModel], ServiceErrors>) -> Void
    )
}

final class HomeService: ServiceRequester, HomeServiceProtocol {
    
    enum WhichRequest {
        case topAnimes
        case allAnimes
        case recomendedAnimed
    }
    
    //MARK: - Cleaners
    typealias AnimeDataCompletionHandler = (
        (Result<[AnimeModel], ServiceErrors>) -> Void
    )
    
    typealias ListOfAnimesExpectResult = (
        Result<ANHomeAnimeListResponse, ServiceErrors>
    )
    
    //MARK: - HomeServiceProtocol
    
    func executeRequest(
        _ which: WhichRequest,
        completion: @escaping ((Result<[AnimeModel], ServiceErrors>) -> Void)
    ) {
        var request: Request
        
        switch which {
            case .topAnimes:
            request = ANHomeTopAnimesRequestModel()
                
            case .allAnimes:
            request = ANHomeAnimeListRequestModel()
            
            case .recomendedAnimed:
            request = ANHomeTopAnimesRequestModel()
        }
        
        execute(request: request, completion: completion)
    }
    
    //MARK: - Helpers
    private func execute(request: Request, completion: @escaping AnimeDataCompletionHandler) {
        perform(request: request) { [weak self] (result: ListOfAnimesExpectResult) in
            guard let self = self else { return }
            self.resultHandling(result: result, completion: completion)
        }
    }
    
    private func resultHandling(
        result: ListOfAnimesExpectResult, completion: AnimeDataCompletionHandler
    ) {
        switch result {
        case .success(let response):
            let model = self.createModel(response: response)
            completion(.success(model))
        case .failure(let failure):
            completion(.failure(failure))
        }
    }
    
    private func createModel(response: ANHomeAnimeListResponse) -> [AnimeModel] {
        var list: [AnimeModel] = []
        
        response.animeDataList.forEach {
            let model = AnimeModel(response: $0)
            list.append(model)
        }
        return list
    }
}
