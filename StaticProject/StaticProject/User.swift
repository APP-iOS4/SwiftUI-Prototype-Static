//
//  User.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let nickName: String
    let userID: String
    let password: String
    
    var staticScore: Int
    var location: String
}
