//
//  MovieErrorManage.swift
//  TheMovieDB
//
//  Created by Stefanny Toro Ramirez on 3/27/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

enum ErrorEnum: Error {
    case errorDecoder(String)
    case errorDataNotFound
    case errorConectionFaile
    case otherError
}

extension ErrorEnum: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errorDecoder(_):
            return NSLocalizedString("DecodingError", comment: "")
        case .errorDataNotFound:
            return NSLocalizedString("Description", comment: "")
        case .otherError:
            return NSLocalizedString("Other error", comment: "")
        case .errorConectionFaile:
            return NSLocalizedString("Error conection faile", comment: "")
        }
    }
}

struct RequestError {
    var statusCode: Int
    var context: DecodingError.Context?
    var message: String
    var type: String
    
    init(statusCode: Int, context: DecodingError.Context?, message: String, type: String) {
        self.statusCode = statusCode
        self.context = context
        self.message = message
        self.type = type
    }
}

struct ErrorHandler {
    static func response(error: Error,statusCode: Int) -> RequestError {
        if((error as? DecodingError) != nil) {
            let decodingError = error as? DecodingError
            let decodeError = "decodeError"
            switch decodingError {
            case .valueNotFound( _,let context)?:
                return RequestError(statusCode: statusCode, context: context, message: context.debugDescription,type: decodeError)
                
            case .keyNotFound( _, let context)?:
                return RequestError(statusCode: statusCode, context: context, message: context.debugDescription, type: decodeError)
                
            case .dataCorrupted(let context)?:
                return RequestError(statusCode: statusCode, context: context, message: context.debugDescription,type: decodeError)
                
            case .typeMismatch( _, let context)?:
                return RequestError(statusCode: statusCode, context: context, message: context.debugDescription, type: decodeError)
            default:
                return RequestError(statusCode: statusCode, context: nil, message: "Could not parse", type: decodeError)
            }
        }
        return RequestError(statusCode: statusCode, context: nil, message:error.localizedDescription, type: "Faile response")
    }
}
