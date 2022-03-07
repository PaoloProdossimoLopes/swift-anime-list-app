//
//  HomeViewController.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import UIKit
import ANLIB

final class HomeViewController: UIViewController {
    
    //MARK: - Properties
    let contentView: HomeView
    private let viewModel: HomeViewModelProtocol
    
    //MARK: - Constructor
    init(contentView: HomeView, viewModel: HomeViewModelProtocol) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.setupControllerDelegate(self)
        contentView.setupDelegate(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.starter()
    }
    
    //MARK: - Helpers
    private func createAnimeCollectionViewCell(
        _ collectionView: UICollectionView, at indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TopAnimeCollectionViewCell.identifier,
            for: indexPath
        ) as? TopAnimeCollectionViewCell else { return UICollectionViewCell() }

        let model = viewModel.getTopModels(at: indexPath.row)
        cell.setupImage(image: model.image)
        return cell
    }
    
    private func createAnimeTableViewCell(
        _ tableView: UITableView, at indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AllAnimeListTableViewCell.identifier,
            for: indexPath
        ) as? AllAnimeListTableViewCell else { return UITableViewCell() }
        
        let model = viewModel.getAnimeModel(at: indexPath.row)
        cell.setupInformations(model: model)
        
        return cell
    }
}

//MARK: - HomeViewModelToControllerDelegate
extension HomeViewController: HomeViewModelToControllerDelegate {
    func updateViewWithError(errors: [ServiceErrors]) {
        
    }
    
    func updateView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.contentView.topCollectionView.reloadData()
        }
    }
}

//MARK: - Collection DataSource and Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsForTopAnimeCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createAnimeCollectionViewCell(collectionView, at: indexPath)
    }
}

//MARK: - TableView DataSource and Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsFotAllAnimesTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createAnimeTableViewCell(tableView, at: indexPath)
    }
}
