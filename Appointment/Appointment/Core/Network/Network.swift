//
//  Network.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

import Foundation

import RxSwift

protocol CoreRequest {
  var method: Network.HTTPMethod { get }
  var path: String { get }
  var parameters: [String: Any]? { get set }
  var token: String? { get }
}

protocol Networkable {
  func request<T: Codable>(
    _ request: CoreRequest,
    response: T.Type
  ) -> Observable<T>
}

final class Network: Networkable {
  enum HTTPError: Error {
    case unkownURL
    case unkownData
  }

  enum HTTPMethod: String {
    case delete
    case get
    case post
    case put
  }
  
  private let session: URLSession
  private let baseURL: String = "https://drmqqswamrbanxjxzpki.supabase.co/"
  
  private let disposeBag = DisposeBag()
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

extension Network {
  func request<T: Codable>(
    _ request: CoreRequest,
    response: T.Type
  ) -> Observable<T> {
    return Observable
      .create { [weak self] observable in
        guard let self = self else { return Disposables.create() }
        guard let url: URL = URL(string: self.baseURL + request.path) else {
          observable.onError(HTTPError.unkownURL)
          return Disposables.create()
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = request.method.rawValue.uppercased()
        urlRequest.setValue(
          "Bearer token",
          forHTTPHeaderField: "Authorization"
        )
        
        let dataTask = self.session.dataTask(
          with: urlRequest,
          completionHandler: { data, response, error in
            
            guard error == nil else { observable.onError(error!); return }
            guard let data = data else { observable.onError(HTTPError.unkownData); return }
            
            do {
              let decoder = JSONDecoder()
              let decoded = try decoder.decode(T.self, from: data)
              observable.onNext(decoded)
              observable.onCompleted()
            } catch {
              observable.onError(error)
            }
          })
        
        dataTask.resume()
        
        return Disposables.create {
          dataTask.cancel()
        }
      }
  }
}

extension Network {
  struct Reqeust { }
  struct Response { }
}
