//
//  SpyNavigationController.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 06/05/2023.
//

import UIKit

class SpyNavigationController: UINavigationController {
    var pushViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushViewController = viewController
    }
}
