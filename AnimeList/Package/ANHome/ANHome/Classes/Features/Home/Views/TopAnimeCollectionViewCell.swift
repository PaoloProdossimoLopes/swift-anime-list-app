//
//  TopAnimeCollectionViewCell.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 07/03/22.
//

import UIKit
import ANLIB

final class TopAnimeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: self)
    
    private let animeImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 50/2
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 1
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(image: UIImage?) {
        animeImage.image = image
    }
}

extension TopAnimeCollectionViewCell: ANViewLayoutConfigurator {
    func configureHierarcy() {
        addSubview(animeImage)
    }
    
    func configureConstrants() {
        animeImage.ANStylable.applyConstraint { view in
            view.centerX(reference: self.centerXAnchor)
            view.centerY(reference: self.centerYAnchor)
            view.height(size: 50)
            view.width(size: 50)
        }
    }
}
