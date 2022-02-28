//
//  ANViewLayoutConfigurator.swift
//  ANAuth
//
//  Created by Paolo Prodossimo Lopes on 28/02/22.
//

import Foundation

public protocol ANViewLayoutConfigurator {
    func configureHierarcy()
    func configureConstrants()
    func confugreStyle()
    func commonInit()
}

public extension ANViewLayoutConfigurator {
    
    func commonInit() {
        configureHierarcy()
        configureConstrants()
        confugreStyle()
    }
    
    func confugreStyle() { /*...*/}
}
