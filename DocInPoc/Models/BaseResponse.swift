//
//  BaseResponse.swift
//  DocInPoc
//
//  Created by Nodirbek Khudoyberdiev on 28/04/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Bool?
    let message: String?
    let data: T?
    let code: Int?
//    let meta: ResponseMeta?
}

struct BaseError: Codable, Error {
    let status: Bool?
    let message: String?
    let code: Int?
}
