//
//  Room.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import Foundation

enum Category: String {
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
    
    // TODO: change Type
    let id: UUID = UUID()               // id
    let admin: String                   // 방장
    let date: String                      // 날짜
    let location: String                // 위치
    var numberOfParticipants: Int       // 현재 참가 인원 수
    
    // MARK: Fix
    let title: String                   // 제목
    let limitOfParticipants: Int        // 최대 인원 수
    
    var participants: [User] = []       // 참가 인원
    
    var isOnline: Bool
    
    let category: Category              // 카테고리
    let sexLimit: SexLimit              // 성별 제한
    let ageLimit: AgeLimit              // 나이 제한
}
