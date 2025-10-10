//
//  checkBlankString.swift
//  CupcakeCorner
//
//  Created by Hoàng Minh Hải Đăng on 09/10/25.
//

import Foundation

extension String {
    var isBlank: Bool {
        allSatisfy { $0.isWhitespace }
    }
}
