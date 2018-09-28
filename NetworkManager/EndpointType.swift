//
//  YZEndpointType.swift
//  YZNetworkManager
//
//  Created by Yerassyl Zhassuzakhov on 9/26/18.
//  Copyright © 2018 Yerassyl Zhassuzakhov. All rights reserved.
//

import Foundation
import Alamofire

public protocol EndPointType {
    var baseURL: URL { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
    var headers: HTTPHeaders { get }
    var path: String { get }
}

public enum HTTPTask {
    case request
    case requestWithParameters(parameters: Parameters)
    case requestWithMultipartData(data: Any, parameters: Parameters, dataParameterName: String)
}

public enum Result<T> {
    case success(T)
    case failure(String)
}
