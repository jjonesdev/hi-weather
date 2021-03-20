//
//  Coordinator.swift
//  HiWeather
//
//  Created by Jordan Jones on 3/20/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
