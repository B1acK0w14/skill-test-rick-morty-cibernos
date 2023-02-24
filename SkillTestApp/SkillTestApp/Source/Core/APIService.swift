//
//  APIService.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Alamofire

struct APIServices {
    
    // MARK: - Properties
    public static let shared = APIServices()
    
    // MARK: - Functions
    func callGetAllCharacters(followingPageURL: String,
                              parametersToSend: Parameters? = nil,
                              success: @escaping (_ result: AllCharactersModel?) -> Void,
                              failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        var url = (followingPageURL.isEmpty) ? TraccarEndpoint.allCharacters.url.absoluteString : followingPageURL
        var components = URLComponents(string: url)!
        
        if let arrayParams = parametersToSend {
            components.queryItems = arrayParams.map { (key, value) in
                URLQueryItem(name: key, value: value as? String)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }

        APIManager.shared.callAPI(serverURL: components.string ?? String.emptyString,
                                  method: .get,
                                  headers: headers,
                                  success: { response in
            do {
                if let data = response.data {
                    let getAllCharactersResponse = try JSONDecoder().decode(AllCharactersModel.self, from: data)
                    success(getAllCharactersResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
