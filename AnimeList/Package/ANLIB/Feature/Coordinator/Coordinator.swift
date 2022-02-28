//
//  Coordinator.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation

open class Coordinator: CoordinatorProtocol {
    public typealias onDismissedCallback = (() -> Void)
    
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    open func start() {
        //This mehods must be overrided withou super.
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    open func present(animated: Bool, onDismissed: onDismissedCallback?) {
        //This mehods must be overrided withou super.
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    open func presentChild(_ child: Coordinator, animated: Bool, onDismissed: (onDismissedCallback?)) {
        children.append(child)
        child.present(animated: animated, onDismissed: { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        })
    }
    
    public func dismiss(animated: Bool, onDismissed: (onDismissedCallback?) = nil) {
        router.dismiss(animated: animated, onDismissed: onDismissed)
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else { return }
        children.remove(at: index)
    }
}
