//
//  RoomStore.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation

@Observable
class RoomStore {
    var allRooms: [Room] = []                                                 // 모든 방 배열
    
    var selectedDate: String = "2024-02-21"                                   // 날짜
    var filteredDateRooms: [Room] {
        allRooms.filter({ $0.dateString == selectedDate })
    }
    
    var selectedOnOfflineCase: OnOfflineCases = .Both                         // (온라인 vs 오프라인) 체크
    var filteredOnOfflineRooms: [Room] {
        if selectedOnOfflineCase == .Both {
            return filteredDateRooms
        } else {
            return filteredDateRooms.filter({ $0.tagOnOffline == selectedOnOfflineCase })
        }
    }
    
    var selectedCategory: Category?                                           // 선택된 카테고리
    var filteredCategoryRooms: [Room] {
        if let selectedCategory {
            return filteredOnOfflineRooms.filter({ $0.category == selectedCategory })
        } else {
            return filteredOnOfflineRooms
        }
    }
    
    var searchText: String = ""                                                // 검색 텍스트
    var filteredSearchRooms: [Room] {
        if searchText.isEmpty {
            return filteredCategoryRooms
        } else {
            return filteredCategoryRooms.filter({ $0.title.localizedStandardContains(searchText) })
        }
    }
    
    func setDateWithString() {
        
    }
    
    init () {
        allRooms = [
            
            Room(
                title: "온라인으로 캘리그라피", dateString: "2024-02-22", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 0), limitOfParticipants: 4,
                participants: [
                    UserStore.SampleUser(index: 1),
                    UserStore.SampleUser(index: 2),
                ],
                isOnline: true, category: .Culture, sexLimit: .None, ageLimit: .None , wattLimit: 92
            ),
            
            Room(
                title: "(경기) 화요일 경도 할 사람?", dateString: "2024-02-22", timeString: "16:30",
                location: "경기 의정부시 청사로 1",
                admin: UserStore.SampleUser(index: 2), limitOfParticipants: 10,
                participants: [
                    UserStore.SampleUser(index: 0),
                    UserStore.SampleUser(index: 1),
                    UserStore.SampleUser(index: 3),
                    UserStore.SampleUser(index: 4),
                ],
                isOnline: false, category: .Sports, sexLimit: .None, ageLimit: .Twenty, wattLimit: 90
            ),
            
            Room(
                title: "(서울) 같이 남산타워 가실분?", dateString: "2024-02-23", timeString: "14:30",
                location: "서울시 용산구 남산공원길",
                admin: UserStore.SampleUser(index: 3), limitOfParticipants: 10,
                participants: [
                    UserStore.SampleUser(index: 0),
                    UserStore.SampleUser(index: 1),
                    UserStore.SampleUser(index: 2),
                    UserStore.SampleUser(index: 4),
                    UserStore.SampleUser(index: 5),
                ],
                isOnline: false, category: .Walking, sexLimit: .None, ageLimit: .Twenty, wattLimit: 88
            ),
            
            Room(
                title: "롤", dateString: "2024-02-23", timeString: "11:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 4), limitOfParticipants: 5,
                participants: [
                    
                ],
                isOnline: true, category: .Game, sexLimit: .None, ageLimit: .UnderTen, wattLimit: 95
            ),
            
            Room(
                title: "같이 ABC 피트니스 가실분?", dateString: "2024-02-22", timeString: "20:30",
                location: "인천 부평구 장제로",
                admin: UserStore.SampleUser(index: 5), limitOfParticipants: 2,
                participants: [
    
                ],
                isOnline: false, category: .Sports, sexLimit: .OnlyFemale, ageLimit: .Twenty, wattLimit: 100
            ),
            
            // MARK: ----
            
            Room(
                title: "ABC", dateString: "2024-02-24", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 0), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: true, category: .Driving, sexLimit: .None, ageLimit: .None, wattLimit: 100
            ),
            
            Room(
                title: "DEF", dateString: "2024-02-24", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 1), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: true, category: .Music, sexLimit: .None, ageLimit: .None, wattLimit: 70
            ),
            
            Room(
                title: "GHI", dateString: "2024-02-23", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 2), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: false, category: .Food, sexLimit: .None, ageLimit: .None, wattLimit: 60
            ),
            
            Room(
                title: "Jkl", dateString: "2024-02-22", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 3), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: false, category: .Language, sexLimit: .None, ageLimit: .None, wattLimit: 80
            ),
            
            Room(
                title: "mnO", dateString: "2024-02-23", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 4), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: true, category: .Language, sexLimit: .None, ageLimit: .None, wattLimit: 95
            ),
            
            Room(
                title: "XYz", dateString: "2024-02-24", timeString: "16:30",
                location: "서울시 강남구 양재동",
                admin: UserStore.SampleUser(index: 5), limitOfParticipants: 2,
                participants: [
                ],
                isOnline: false, category: .Music, sexLimit: .None, ageLimit: .None, wattLimit: 92
            ),
        ]
    }
    
    func appendRoom(room: Room) {
        allRooms.append(room)
    }
    
    // week = yyyy-MM-dd / time = HH:mm
    func setRoomDate(week: String, time: String) -> Date {
        let dateStr = "\(week) \(time)"
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                
        return dateFormatter.date(from: dateStr) ?? Date() // Date 타입으로 변환
    }
}
