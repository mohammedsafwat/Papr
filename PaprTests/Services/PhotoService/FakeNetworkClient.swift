//
//  FakeNetworkClient.swift
//  PaprTests
//
//  Created by Mohammed on 09.02.20.
//  Copyright © 2020 Joan Disho. All rights reserved.
//

import Foundation
import TinyNetworking
@testable import Papr

class FakeNetworkClient<R: Resource>: TinyNetworking<Unsplash> {
    let session: TinyNetworkingSession
    
    init(session: TinyNetworkingSession) {
        self.session = session
    }
    
    override func request(resource: Unsplash, session: TinyNetworkingSession = URLSession.shared, queue: DispatchQueue = .main, completion: @escaping (Result<Response, TinyNetworkingError>) -> Void) -> URLSessionDataTask {
        let request = URLRequest(url: resource.baseURL)
        return self.session.loadData(with: request, queue: queue) { (response, error) in
            if let error = error {
                completion(.failure(.underlying(error, response)))
                return
            }
            completion(.success(response))
        }
    }
}
