//
//  ModalRouter.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

final class ModalNavigationRouter: NSObject {
    
    private let parentViewController: UIViewController
    private let navigationController = UINavigationController()
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    
    var typeOfModal: UIModalPresentationStyle = .formSheet
    var showCancelButton: Bool = false
    var hideNavigationBar: Bool = false
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
        navigationController.delegate = self
    }
}

extension ModalNavigationRouter: Router {
    
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed
        
        if navigationController.viewControllers.count == 0 {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func dismiss(animated: Bool, onDismissed: (() -> Void)?) {
        guard let first = navigationController.viewControllers.first else { return }
        performOnDismissed(for: first)
        parentViewController.dismiss(animated: animated, completion: onDismissed)
    }
    
    //MARK: - Private methods
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        configureStyle(viewController)
        navigationController.setViewControllers([viewController], animated: false)
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func configureStyle(_ viewController: UIViewController) {
        if showCancelButton { addCancelButton(to: viewController) }
        navigationController.isNavigationBarHidden = hideNavigationBar
        navigationController.modalPresentationStyle = typeOfModal
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        let button = UIBarButtonItem(
            title: "Cancel", style: .plain,
            target: self, action: #selector(cancelPressed)
        )
        viewController.navigationItem.leftBarButtonItem = button
    }
    
    @objc private func cancelPressed(onDismissed: (() -> Void)? = nil) {
        performOnDismissed(for: navigationController.viewControllers.first!)
        dismiss(animated: true, onDismissed: onDismissed)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension ModalNavigationRouter: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController, animated: Bool
    ) {
        guard let dismissedViewController = navigationController
                                                .transitionCoordinator?
                                                .viewController(forKey: .from),
                                            !navigationController.viewControllers
                                                .contains(dismissedViewController)
        else { return }
        performOnDismissed(for: dismissedViewController)
    }
}
