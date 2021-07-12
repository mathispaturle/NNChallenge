//
//  UINavigationViewController+Completion.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit

extension UINavigationController {
    func pushToViewController(_ viewController: UIViewController, animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    func popViewController(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }

    func popToViewController(_ viewController: UIViewController, animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    func popToRootViewController(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
          popToViewController(vc, animated: animated)
        }
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true, andNavigateTo: UIViewController) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            self.popToViewController(vc, animated: true) {
                self.pushViewController(andNavigateTo, animated: true)
            }
        }
    }
}
