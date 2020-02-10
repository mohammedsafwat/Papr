//
//  MockTinyNetworkingSession.swift
//  PaprTests
//
//  Created by Mohammed on 09.02.20.
//  Copyright © 2020 Joan Disho. All rights reserved.
//

import Foundation
import TinyNetworking

class MockTinyNetworkingSession: TinyNetworkingSession {
    let data = Data([0, 1, 0, 1])
    var httpURLResponse: HTTPURLResponse?
    var error: Error?
    
    func loadData(with urlRequest: URLRequest, queue: DispatchQueue, completionHandler: @escaping TinyNetworkingSession.CompletionHandler) -> URLSessionDataTask {
        let response = Response(urlRequest: urlRequest, data: self.data, httpURLResponse: httpURLResponse)
        completionHandler(response, error)
        return URLSessionDataTask()
    }
}
