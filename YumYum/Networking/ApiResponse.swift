//
//  ApiResponse.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 17/10/2022.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
