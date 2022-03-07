//
//  HomeViewModelProperties.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

struct HomeViewModelProperties {
    weak var controllerDelegate: HomeViewModelToControllerDelegate?
    weak var coordinatorDelegate: HomeViewModelToCoordinatorDelegate?
    
    var service: HomeServiceProtocol?
    
    var animeList: [AnimeModel] = []
    var topAnimeList: [AnimeModel] = []
    var recommendedAnimeList: [AnimeModel] = []
    
    var animeListError: ServiceErrors?
    var topAnimeListError: ServiceErrors?
    var recommendedAnimeListError: ServiceErrors?
    
    let dGroup = DispatchGroup()
}
