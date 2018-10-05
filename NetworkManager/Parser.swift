//
//  YZParser.swift
//  YZNetworkManager
//
//  Created by Yerassyl Zhassuzakhov on 9/26/18.
//  Copyright © 2018 Yerassyl Zhassuzakhov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol Parser {
    func parse<T: Decodable>(response: DataResponse<Any>) -> Result<T>
}

public extension Parser {
    func parse<T: Decodable>(response: DataResponse<Any>) -> Result<T> {
        switch response.result {
        case .failure(let error):
            return Result.failure(error.localizedDescription)
        case .success(_):
            if let json = response.result.value, let result = JSON(json).arrayObject as? [[String: Any]] {
                if JSONSerialization.isValidJSONObject(result) {
                    do {
                        let data = try JSONSerialization.data(withJSONObject: result, options: [])
                        let retrievingData = try JSONDecoder().decode(T.self, from: data)
                        
                        return Result.success(retrievingData)
                    } catch {
                        return Result.failure(error.localizedDescription)
                    }
                } else {
                    return Result.failure("Result is not a valid JSON object")
                }
            } else {
                return Result.failure("Ошибка при обработке данных!")
            }
        }
    }
}
