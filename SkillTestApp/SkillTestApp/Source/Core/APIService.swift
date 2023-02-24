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
                              parameters: Parameters? = nil,
                              success: @escaping (_ result: AllCharactersModel?) -> Void,
                              failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(serverURL: (followingPageURL.isEmpty) ? TraccarEndpoint.allCharacters.url.absoluteString : followingPageURL,
                                  method: .get,
                                  headers: headers,
                                  parameters: parameters,
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
