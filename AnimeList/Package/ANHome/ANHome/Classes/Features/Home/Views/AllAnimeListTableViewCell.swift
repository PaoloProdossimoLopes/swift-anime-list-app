//
//  AllAnimeListTableViewCell.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

import UIKit
import ANLIB

final class AllAnimeListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: self)
    
    //MARK: - UI components
    private(set) lazy var animeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.backgroundColor = .red
        image.layer.cornerRadius = 5
        return image
    }()
    
    private(set) lazy var animeName: UILabel = {
        let label = UILabel()
        label.text = "Naruto"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    //MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInformations(model: AnimeModel) {
        animeImage.image = model.image
        animeName.text = model.animeName
    }
}

extension AllAnimeListTableViewCell: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(animeImage)
        addSubview(animeName)
    }
    
    func configureConstrants() {
        animeImage.ANStylable.applyConstraint { view in
            view.leading(reference: leadingAnchor)
            view.top(reference: topAnchor, spacing: 5)
            view.bottom(reference: bottomAnchor, spacing: -5)
            view.width(size: 50)
        }
        
        animeName.ANStylable.applyConstraint { view in
            view.leading(reference: animeImage.trailingAnchor, spacing: 10)
            view.top(reference: topAnchor, spacing: 10)
            view.trailing(reference: trailingAnchor, spacing: -20)
        }
    }
    
    func confugreStyle() {
        backgroundColor = .white
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
