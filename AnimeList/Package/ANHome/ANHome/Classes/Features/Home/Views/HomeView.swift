//
//  HomeView.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import UIKit
import ANLIB

final class HomeView: UIView {
    
    typealias delegateRequired = (
        UICollectionViewDelegate & UICollectionViewDataSource &
        UITableViewDelegate & UITableViewDataSource
    )
    
    //MARK: - UI components
    
    private(set) lazy var topCollectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Animes"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private(set) var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(
            TopAnimeCollectionViewCell.self,
            forCellWithReuseIdentifier: TopAnimeCollectionViewCell.identifier
        )
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private(set) lazy var allAnimesListHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Animes"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var allAnimesTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.register(
            AllAnimeListTableViewCell.self,
            forCellReuseIdentifier: AllAnimeListTableViewCell.identifier
        )
        table.rowHeight = 60
        table.tableFooterView = UIView()
        table.backgroundView = UIView()
        table.separatorColor = .white
        
        return table
    }()
    
    //MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDelegate(_ delegate: delegateRequired) {
        topCollectionView.delegate = delegate
        topCollectionView.dataSource = delegate
        
        allAnimesTableView.delegate = delegate
        allAnimesTableView.dataSource = delegate
    }
}

extension HomeView: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(topCollectionHeaderLabel)
        addSubview(topCollectionView)
        
        addSubview(allAnimesListHeaderLabel)
        addSubview(allAnimesTableView)
    }
    
    func configureConstrants() {
        topCollectionHeaderLabel.ANStylable.applyConstraint { view in
            view.top(reference: safeAreaLayoutGuide.topAnchor, spacing: 20)
            view.leading(reference: leadingAnchor, spacing: 20)
            view.trailing(reference: trailingAnchor)
        }
        
        topCollectionView.ANStylable.applyConstraint { view in
            view.top(reference: topCollectionHeaderLabel.bottomAnchor)
            view.leading(reference: leadingAnchor, spacing: 10)
            view.trailing(reference: trailingAnchor)
            view.height(size: 60)
        }
        
        allAnimesListHeaderLabel.ANStylable.applyConstraint { view in
            view.top(reference: topCollectionView.bottomAnchor, spacing: 20)
            view.leading(reference: leadingAnchor, spacing: 20)
            view.trailing(reference: trailingAnchor)
        }
        
        allAnimesTableView.ANStylable.applyConstraint { view in
            view.top(reference: allAnimesListHeaderLabel.bottomAnchor, spacing: 10)
            view.leading(reference: leadingAnchor, spacing: 20)
            view.trailing(reference: trailingAnchor, spacing: -20)
            view.bottom(reference: safeAreaLayoutGuide.bottomAnchor)
        }
    }
    
    func confugreStyle() {
        backgroundColor = .white
    }
}
