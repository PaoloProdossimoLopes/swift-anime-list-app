//
//  Coordinator.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation

class Coordinator: CoordinatorProtocol {
    typealias onDismissedCallback = (() -> Void)
    
    var children: [Coordinator] = []
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        //This mehods must be overrided withou super.
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func present(animated: Bool, onDismissed: onDismissedCallback?) {
        //This mehods must be overrided withou super.
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (onDismissedCallback?)) {
        children.append(child)
        child.present(animated: animated, onDismissed: { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        })
    }
    
    func dismiss(animated: Bool, onDismissed: (onDismissedCallback?) = nil) {
        router.dismiss(animated: animated, onDismissed: onDismissed)
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else { return }
        children.remove(at: index)
    }
}
