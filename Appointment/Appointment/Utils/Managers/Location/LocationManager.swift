//
//  LocationManager.swift
//  Appointment
//
//  Created by hyosung on 2022/12/27.
//

import CoreLocation

protocol LocationManagable {
  var authorizationStatus: CLAuthorizationStatus { get }
  var delegate: LocationManagerDelegate? { get }
  
  func requestWhenInUseAuthorization()
}

protocol LocationManagerDelegate {
  func didUpdateLocations(_ locations: [CLLocation])
}

final class LocationManager: NSObject, LocationManagable {
  static let shared: LocationManagable = LocationManager()
  
  private let locationManager: CLLocationManager = {
    let manager = CLLocationManager()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.distanceFilter = kCLDistanceFilterNone
    return manager
  }()
  
  var delegate: LocationManagerDelegate?
  
  var authorizationStatus: CLAuthorizationStatus {
    return locationManager.authorizationStatus
  }
  
  private override init() {
    super.init()
    locationManager.delegate = self
  }
  
  func requestWhenInUseAuthorization()  {
    self.locationManager.requestWhenInUseAuthorization()
  }
}

extension LocationManager: CLLocationManagerDelegate {
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    delegate?.didUpdateLocations(locations)
  }
}
