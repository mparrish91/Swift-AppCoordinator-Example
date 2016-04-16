//
//  AppCoordinator.swift
//  provoq
//
//  Created by parry on 2/22/16.
//  Copyright © 2016 provoq. All rights reserved.
//

import UIKit

class AppCoordinator: NSObject {
    
    var isLoggedIn: Bool?
    var navigationController: UINavigationController?
    weak var delegate: AppCoordinatorDelegate?
    
    var childCoordinators: [AnyObject]?
    
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isLoggedIn == true {
            self.showContent()
        }else{
            self.showAuthentication()
        }
    }
    
    func showAuthentication() {
        let authCoordinator = AuthenticationCoordinator(withNavigationController: self.navigationController!)
//        authCoordinator.delegate = self
        authCoordinator.start()
        self.childCoordinators?.append(authCoordinator)
        
    }
    
    func coordinatorDidAuthenticate(coordinator: AppCoordinator) {
        self.childCoordinators?.removeObject(coordinator)
        self.showContent()
        
    }
    
    func showContent() {
        
    }
    

    

}


extension Array {
    
    mutating func removeObject<T: Equatable>(object: T) -> Bool {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            
            if let toCompare = objectToCompare as? T {
                if toCompare == object {
                    index = idx
                    break
                }
            }
        }
        
        if(index != nil) {
            self.removeAtIndex(index!)
            return true
        } else {
            return false
        }
}
}



