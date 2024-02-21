//
//  message.swift
//  StaticProject
//
//  Created by 하윤호 on 2/21/24.
//

import Foundation

struct Message: Identifiable {
    let id: UUID = UUID()
    let message: String
    let date: String
}
