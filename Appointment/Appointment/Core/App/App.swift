//
//  App.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

import UIKit

class App: NSObject {

  // Singleton
  static let shared = App()

  // MARK: - Properties

  var window: UIWindow?
  var windowScene: UIWindowScene?

  // MARK: - Initialize

  override private init() {
    super.init()
  }

  /// 앱 실행시 초기 셋팅 담당
  func globalConfigure() {}

  /// 초기 화면
  func presentInitialScreen(in window: UIWindow, with windowScene: UIWindowScene, options connectionOptions: UIScene.ConnectionOptions) {
    self.window = window
    self.windowScene = windowScene
    self.window?.backgroundColor = .white
    self.window?.overrideUserInterfaceStyle = .light
    self.window?.rootViewController = SplashViewController()
    self.window?.makeKeyAndVisible()
  }
}
