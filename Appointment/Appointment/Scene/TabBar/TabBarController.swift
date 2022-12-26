//
//  TabBarController.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

import UIKit

final class TabBarController: UITabBarController {
  
  // MARK: - UI Properties
  
  // MARK: - Properties

  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Setup
  
  private func setupUI() {
    clearTabBar()
    delegate = self
    setViewControllers(
      TabBarItem.makeTabBarController(),
      animated: false
    )
  }
}

// MARK: - Helper methods

extension TabBarController {
  
  func selectTab(_ index: Int) {
    selectedIndex = index
  }
  
  private func clearTabBar() {
    UITabBar.appearance().shadowImage = UIImage()
    UITabBar.appearance().backgroundImage = UIImage()
    UITabBar.appearance().backgroundColor = .white
  }
}

// MARK: UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
  func tabBarController(
    _ tabBarController: UITabBarController,
    didSelect viewController: UIViewController
  ) {}
}
