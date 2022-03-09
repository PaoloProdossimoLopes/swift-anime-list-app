//
//  HomeViewModel.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import Foundation

protocol HomeViewModelToCoordinatorDelegate: AnyObject {
    
}

protocol HomeViewModelToControllerDelegate: AnyObject {
    func updateViewWithError(errors: [ServiceErrors])
    func updateView()
}

protocol HomeViewModelProtocol {
    func starter()
    func setupControllerDelegate(_ delegate: HomeViewModelToControllerDelegate)
    
    func getNumberOfRowsForTopAnimeCollectionView() -> Int
    func getNumberOfRowsFotAllAnimesTableView() -> Int
    
    func getTopModels(at index: Int) -> AnimeModel
    func getAnimeModel(at index: Int) -> AnimeModel
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private weak var controllerDelegate: HomeViewModelToControllerDelegate?
    private weak var coordinatorDelegate: HomeViewModelToCoordinatorDelegate?

    private let service: HomeServiceProtocol

    private var animeList: [AnimeModel] = []
    private var topAnimeList: [AnimeModel] = []
    private var recommendedAnimeList: [AnimeModel] = []

    private var animeListError: ServiceErrors?
    private var topAnimeListError: ServiceErrors?
    private var recommendedAnimeListError: ServiceErrors?
    
    private let dGroup = DispatchGroup()
    
    init(_ delegate: HomeViewModelToCoordinatorDelegate, service: HomeServiceProtocol) {
        self.coordinatorDelegate = delegate
        self.service = service
    }
    
    func setupControllerDelegate(_ delegate: HomeViewModelToControllerDelegate) {
        controllerDelegate = delegate
    }
    
    func starter() {
        fetchInsideAllAPIs()
        configureNotify()
    }
    
    func getNumberOfRowsForTopAnimeCollectionView() -> Int {
        return topAnimeList.count
    }
    
    func getNumberOfRowsFotAllAnimesTableView() -> Int {
        return animeList.count
    }
    
    func getTopModels(at index: Int) -> AnimeModel {
        return topAnimeList[index]
    }
    
    func getAnimeModel(at index: Int) -> AnimeModel {
        return animeList[index]
    }
    
    //MARK: - Helper
    private func configureNotify() {
        dGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            
            if let anyAPIError = self.APIErrorHandler() {
                self.controllerDelegate?.updateViewWithError(errors: anyAPIError)
            }
            
            self.controllerDelegate?.updateView()
        }
    }
    
    private func fetchInsideAllAPIs() {
        fetchAllAnimes()
        fetchTopAnimes()
        //fetchRecomendedAnimes()
    }
    
    private func fetchAllAnimes() {
        dGroup.enter()
        service.executeRequest(.allAnimes) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let response):
                self.animeList = response
                
                case .failure(let error):
                self.animeListError = error
            }
            
            self.dGroup.leave()
        }
    }
    
    private func fetchTopAnimes() {
        dGroup.enter()
        service.executeRequest(.topAnimes) { [weak self] result in
            guard let self = self else {
                self?.dGroup.leave()
                return
            }
            
            switch result {
                case .success(let response):
                self.topAnimeList = response
                
                case .failure(let error):
                self.topAnimeListError = error
            }
            
            self.dGroup.leave()
        }
    }
    
    private func fetchRecomendedAnimes() {
        dGroup.enter()
        service.executeRequest(.recomendedAnimed) { [weak self] result in
            guard let self = self else {
                self?.dGroup.leave()
                return
            }
            
            switch result {
                case .success(let response):
                self.recommendedAnimeList = response
                dump(self.recommendedAnimeList.first?.image)
                    
                case .failure(let error):
                self.recommendedAnimeListError = error
            }
            
            self.dGroup.leave()
        }
    }
    
    private func APIErrorHandler() -> [ServiceErrors]? {
        var listOfErrors: [ServiceErrors]? = nil
        
        let errors = [
            animeListError, topAnimeListError, recommendedAnimeListError
        ]
        
        errors.forEach { error in
            if let error = error {
                listOfErrors?.append(error)
            }
        }
        
        return listOfErrors
    }
}
