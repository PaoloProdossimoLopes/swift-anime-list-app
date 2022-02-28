//
//  Coord.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

protocol CoordinatorProtocol {
    //Expect: () -> Void
    associatedtype onDismissedCallback
    
    var children: [Coordinator]{ get set }
    var router: Router { get }
    
    func start()
    
    func present(animated: Bool, onDismissed: onDismissedCallback?)
    func dismiss(animated: Bool, onDismissed: onDismissedCallback?)
    func presentChild(_ child: Coordinator, animated: Bool, onDismissed: onDismissedCallback?)
}
