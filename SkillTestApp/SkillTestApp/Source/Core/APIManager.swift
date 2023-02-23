//
//  APIManager.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Alamofire
public typealias FailureMessage = String

public class APIManager {
    // MARK: - Properties
    public static let shared = APIManager()
    
    // MARK: - Functions
    func callAPI(serverURL: String,
                 method: HTTPMethod = .get,
                 headers: HTTPHeaders? = nil,
                 parameters: Parameters? = nil,
                 success: @escaping ((AFDataResponse<Any>) -> Void),
                 failure: @escaping ((FailureMessage) -> Void)) {
        
        guard let url = URLComponents(string: "\(serverURL)") else {
            failure(L10n.Error.invalidUrl)
            return
        }
        
        // Network request
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    success(response)
                case let .failure(error):
                    failure(error.localizedDescription)
                }
            }
    }
}
