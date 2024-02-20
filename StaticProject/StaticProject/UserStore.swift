//
//  UserStore.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation

class UserStore {
    var users: [User] = []
    
    init () {
        users = [
            User(nickName: "일이삼", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동")
        ]
    }
    
    func appendUser(user: User) {
        users.append(user)
    }
}
