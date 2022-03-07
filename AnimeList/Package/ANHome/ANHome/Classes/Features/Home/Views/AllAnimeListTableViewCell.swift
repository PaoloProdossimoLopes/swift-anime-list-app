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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInformations(model: AnimeModel) {
        
    }
}

extension AllAnimeListTableViewCell: ANViewLayoutConfigurator {
    func configureHierarcy() {
        
    }
    
    func configureConstrants() {
        
    }
}
