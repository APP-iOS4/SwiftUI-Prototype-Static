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
            User(nickName: "일이삼", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "거니거니", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "유노윤호", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "주니영이", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "잼", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "구기서니", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
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
    
    
    // MARK: - Temp
    static func SampleUser(index: Int) -> User {
        let users = [
            User(nickName: "일이삼", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "거니거니", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "유노윤호", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "주니영이", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "잼", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
            User(nickName: "구기서니", userID: "user@apple.com", password: "1q2w3e4r!", staticScore: 100, location: "서울특별시 개포동"),
        ]
        
        if index < 0 || index >= users.count {
            return users[0]
        } else {
            return users[index]
        }
    }
}
