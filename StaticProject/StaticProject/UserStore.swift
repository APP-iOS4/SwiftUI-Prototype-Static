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
    
    func loginUser(id: String, password: String) -> Bool{
        if searchUserToIdPassword(id: id, password: password) != nil {
            return true
        } else {
            return false
        }
    }
    
    private func searchUserToIdPassword(id: String, password: String) -> User? {
        for user in users {
            if user.userID == id && user.password == password {
                return user
            }
        }
        
        return nil
    }
}
