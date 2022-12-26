//
//  TabBarItem.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

import UIKit

protocol TabBarItemProtocol {
  static func makeTabBarController() -> [UINavigationController]
}

enum TabBarItem: Int, TabBarItemProtocol {
  case map
  case appointment
  case setting
  
  private var title: String {
    switch self {
    case .map: return "지도"
    case .appointment: return "약속목록"
    case .setting: return "설정"
    }
  }
  
  private var image: UIImage? {
    switch self {
    case .map: return UIImage(systemName: "map")
    case .appointment: return UIImage(systemName: "list.clipboard")
    case .setting: return UIImage(systemName: "gearshape")
    }
  }
  
  private var selectedImage: UIImage? {
    switch self {
    case .map: return UIImage(systemName: "map.fill")
    case .appointment: return UIImage(systemName: "list.clipboard.fill")
    case .setting: return UIImage(systemName: "gearshape.fill")
    }
  }
  
  private func controller(tabBarItem: TabBarItem) -> UINavigationController {
    switch self {
    case .map:
      let viewController = UIViewController()
      viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
      return UINavigationController(rootViewController: viewController)
    case .appointment:
      let viewController = UIViewController()
      viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
      return UINavigationController(rootViewController: viewController)
    case .setting:
      let viewController = UIViewController()
      viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
      return UINavigationController(rootViewController: viewController)
    }
  }
}

extension TabBarItem {
  static func makeTabBarController() -> [UINavigationController] {
    let tabBarItems: [TabBarItem] = [
      .map,
      .appointment,
      .setting
    ]
    
    return tabBarItems.map { $0.controller(tabBarItem: $0) }
  }
}
