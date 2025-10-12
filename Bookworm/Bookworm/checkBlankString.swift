//
//  checkBlankString.swift
//  Bookworm
//
//  Created by Hoàng Minh Hải Đăng on 12/10/25.
//

import Foundation

extension String {
    var isBlank: Bool {
        allSatisfy({ $0.isWhitespace })
    }
}

