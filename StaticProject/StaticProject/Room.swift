//
//  Room.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation

enum Category: String, CaseIterable {
    case OutDoorTrip = "아웃도어/여행"
    case Volunteer = "봉사활동"
    case Humanities = "인문학/책/글"
    case Language = "외국/언어"
    case Music = "음악/악기"
    case Sports = "운동/스포츠"
    case Ride = "차/오토바이"
    case Job = "업종/직무"
    case Culture = "문화/공연/축제"
    case Crafts = "공예/만들기"
    case Game = "게임"
}

enum SexLimit: String {
    case None = "없음"
    case OnlyFemale = "여자만"
    case OnlyMale = "남자만"
}

enum AgeLimit: String {
    case None = "없음"
    case UnderTen = "10대 이하"
    case Twenty = "20대"
    case Thirty = "30대"
    case Forty = "40대"
    case Fifty = "50대"
    case Sixty = "60대"
    case Seventy = "70대"
    case Eighty = "80대"
    case OverNinety = "90대 이상"
}


struct Room: Identifiable {
    
    // MARK: - 변수
    
    // id
    let id: UUID = UUID()                                           // id
    
    // 제목
    let title: String                                               // 제목
    
    // 날짜 및 시간
    // let savedDate: Date                                          // 저장된 날짜 및 시간
    var dateString: String = ""                                     // 날짜
        // let dateFormatter: DateFormatter = DateFormatter()
        // dateFormatter.dateFormat = "yyyy-MM-dd"
        // return dateFormatter.string(from: savedDate)
    var timeString: String = ""                                     // 시간
        // let dateFormatter: DateFormatter = DateFormatter()
        // dateFormatter.dateFormat = "HH:mm"
        // return dateFormatter.string(from: savedDate)

    // 위치
    let location: String                                            // 위치
    
    // 참가 인원
    let admin: User                                                 // 방장
    let limitOfParticipants: Int                                    // 최대 참가 인원 수
    var participants: [User] = []                                   // 현재 참가 Users
    var numberOfParticipants: Int {                                 // 현재 참가 인원 수
        participants.count + 1
    }
    
    // 태그
    var isOnline: Bool                                              // 온라인 ? 오프라인
    let category: Category                                          // 카테고리
    let sexLimit: SexLimit                                          // 성별 제한
    let ageLimit: AgeLimit                                          // 나이 제한
    
    // 이미지
    let image: String = ""                                          // 이미지
    
    //MARK: - 함수
    
    // 참가인원 추가
    mutating func addParticipants(user: User) -> Bool {
        // 참가 인원 제한보다 참가 인원이 같거나 많으면 "false"를 리턴
        if limitOfParticipants <= numberOfParticipants {
            return false
        }
        
        // 참가인원에 user 추가 후 "true" 리턴
        participants.append(user)
        return true
    }
    
    // 참가에서 제외
    mutating func removeParticipants(user: User) -> Bool {
        // 참가 인원이 1 이하라면 "false"를 리턴
        if numberOfParticipants <= 1 {
            return false
        }
        // 본인이 admin으로 참여하고 있다면 "false"를 리턴
        if admin.id == user.id {
            return false
        }
        
        // user가 참가하는지 확인해서 참가한다면 remove 이후 "true" 리턴
        participants = participants.filter({ $0.nickName != user.nickName })
        return true
    }
    
    // user가 참가하는지 확인
    func isParticipateRoom(user: User) -> Bool {
        // user가 방장이라면 "true"를 리턴
        if admin.nickName == user.nickName {
            return true
        }
        // 방장이 아니고, participants 배열에 존재하면 "true"를 리턴 - 아니라면 "false"를 리턴
        if participants.filter({ $0.nickName == user.nickName }).isEmpty {
            return false
        } else {
            return true
        }
    }
    
}
