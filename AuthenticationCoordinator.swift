//
//  AuthenticationCoordinator.swift
//  provoq
//
//  Created by parry on 2/22/16.
//  Copyright © 2016 provoq. All rights reserved.
//

import UIKit

class AuthenticationCoordinator: NSObject {
    
    
    var isLoggedIn: Bool?
    var navigationController: UINavigationController?
//    var delegate:
    
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
//        loginVC.delegate = self
        navigationController?.pushViewController(loginVC, animated: false)

    }
    
    
    func loginViewControllerDidTapSignup(loginVC: LoginViewController) {
        let permissionVC = PermissionViewController()
//        permissionVC.delegate = self
        navigationController?.pushViewController(permissionVC, animated: true)
        
    }

}


protocol AppCoordinatorDelegate: class {
    func coordinatorDidAuthenticate(coordinator: AppCoordinator)
    
    
}