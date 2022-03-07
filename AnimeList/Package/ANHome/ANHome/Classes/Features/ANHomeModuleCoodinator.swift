//
//  ANHomeModuleCoodinator.swift
//  ANHome
//
//  Created by Paolo Prodossimo Lopes on 06/03/22.
//

import Foundation
import ANLIB

public final class ANHomeModuleCoodinator: Coordinator {
    
    private let flow: ANHomeFlow
    private var homeCoorinator: HomeCoordinator?
    
    public init(flow: ANHomeFlow = .home, router: Router) {
        self.flow = flow
        super.init(router: router)
    }
    
    public override func start() {
        switch flow {
            case .home: goToHome()
        }
    }
    
    private func goToHome() {
        homeCoorinator = .init(router: router)
        homeCoorinator?.start()
    }
}
