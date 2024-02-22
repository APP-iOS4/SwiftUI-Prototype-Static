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
            User(userID: "user1@apple.com", password: "1q2w3e4r!", gender: "남", age: 27, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user2@apple.com", password: "1q2w3e4r!", gender: "남", age: 18, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user3@apple.com", password: "1q2w3e4r!", gender: "여", age: 30, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user4@apple.com", password: "1q2w3e4r!", gender: "여", age: 22, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user5@apple.com", password: "1q2w3e4r!", gender: "남", age: 31, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user6@apple.com", password: "1q2w3e4r!", gender: "여", age: 19, staticScore: 100, location: "서울특별시 개포동"),
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
            User(userID: "user1@apple.com", password: "1q2w3e4r!", gender: "남", age: 27, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user2@apple.com", password: "1q2w3e4r!", gender: "남", age: 18, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user3@apple.com", password: "1q2w3e4r!", gender: "여", age: 30, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user4@apple.com", password: "1q2w3e4r!", gender: "여", age: 22, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user5@apple.com", password: "1q2w3e4r!", gender: "남", age: 31, staticScore: 100, location: "서울특별시 개포동"),
            User(userID: "user6@apple.com", password: "1q2w3e4r!", gender: "여", age: 19, staticScore: 100, location: "서울특별시 개포동"),
        ]
        
        if index < 0 || index >= users.count {
            return users[0]
        } else {
            return users[index]
        }
    }
}
