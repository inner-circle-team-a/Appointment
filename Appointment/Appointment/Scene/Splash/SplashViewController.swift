//
//  SplashViewController.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

import UIKit

final class SplashViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    startApp()
  }
}

// MARK: - Start

extension SplashViewController {
  
  func startApp() {
    let window = App.shared.window
    let rootViewConteroller = TabBarController()
    let navigationController = UINavigationController(
      rootViewController: rootViewConteroller
    )
    UINavigationBar.appearance().isHidden = true
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
