//
//  LoginRepository.swift
//  Appointment
//
//  Created by hyosung on 2022/12/26.
//

// Sample
//import RxSwift
//
//extension Network.Reqeust {
//  struct Login: CoreRequest {
//    var method: Network.HTTPMethod
//    var path: String
//    var parameters: [String : Any]?
//    var token: String?
//  }
//}
//
//extension Network.Response {
//  struct Login: Codable {
//    let ID: Int
//  }
//}
//
//protocol LoginRepositoryProtocol {
//  func login(_ request: Network.Reqeust.Login) -> Single<Network.Response.Login>
//}
//
//final class LoginRepository: LoginRepositoryProtocol {
//  func login(_ request: Network.Reqeust.Login) -> Single<Network.Response.Login> {
//    Network()
//      .request(
//        request,
//        response: Network.Response.Login.self
//      )
//      .asSingle()
//  }
//}
