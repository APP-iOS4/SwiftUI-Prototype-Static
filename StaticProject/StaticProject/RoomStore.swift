//
//  RoomStore.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation
import Observation

@Observable
class RoomStore {
    var allRooms: [Room] = []
    
    var checkIsOnline: Bool = false
    var date: String = "24-02-20"
    var rooms: [Room] {
        allRooms.filter{ ($0.isOnline == checkIsOnline) && ($0.date == date) }
    }
    
    var searchText: String = ""
    var searchedRooms: [Room] {
        rooms.filter({ (room: Room) -> Bool in
            if room.title.localizedStandardContains(searchText) || room.category.rawValue.contains(searchText) {
                return true
            } else {
                return false
            }
        })
    }
    
    init () {
        allRooms = [
            
            Room(
                admin: "거니거니", date: "24-02-22", location: "서울시 강남구 양재동",
                numberOfParticipants: 3, title: "온라인으로 캘리그라피",
                limitOfParticipants: 4, isOnline: true, category: .Culture,
                sexLimit: .None, ageLimit: .None
            ),
            
            Room(
                admin: "유노윤호", date: "24-02-20", location: "경기 의정부시 청사로 1",
                numberOfParticipants: 2, title: "(경기) 화요일 경도 할 사람?",
                limitOfParticipants: 10, isOnline: false, category: .Sports,
                sexLimit: .None, ageLimit: .Twenty
            ),
            
            Room(
                admin: "주니영이", date: "24-02-20", location: "서울시 용산구 남산공원길",
                numberOfParticipants: 4, title: "(서울) 같이 남산타워 가실분?",
                limitOfParticipants: 4, isOnline: false, category: .OutDoorTrip,
                sexLimit: .None, ageLimit: .Twenty
            ),
            
            Room(
                admin: "잼", date: "24-02-21", location: "서울시 강남구 양재동",
                numberOfParticipants: 1, title: "롤",
                limitOfParticipants: 5, isOnline: true, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
            
            Room(
                admin: "구기서니", date: "24-02-20", location: "인천 부평구 장제로",
                numberOfParticipants: 1, title: "XX 헬스장 같이 가실 분",
                limitOfParticipants: 2, isOnline: false, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
            
            // MARK: ---
            
            Room(
                admin: "구기서니", date: "24-02-20", location: "인천 부평구 장제로",
                numberOfParticipants: 1, title: "aBc",
                limitOfParticipants: 2, isOnline: false, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
            
            Room(
                admin: "구기서니", date: "24-02-20", location: "인천 부평구 장제로",
                numberOfParticipants: 1, title: "DeF",
                limitOfParticipants: 2, isOnline: false, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
            
            Room(
                admin: "구기서니", date: "24-02-20", location: "인천 부평구 장제로",
                numberOfParticipants: 1, title: "GhI",
                limitOfParticipants: 2, isOnline: false, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
            
            Room(
                admin: "구기서니", date: "24-02-20", location: "인천 부평구 장제로",
                numberOfParticipants: 1, title: "Jkl",
                limitOfParticipants: 2, isOnline: false, category: .Game,
                sexLimit: .None, ageLimit: .UnderTen
            ),
        ]
    }
    
    func appendRoom(room: Room) {
        allRooms.append(room)
    }
}
