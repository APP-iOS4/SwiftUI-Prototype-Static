//
//  LobbyView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

// 참가했는지
// 이름
// 카테고리
// 나이
// 장소
// 시간

// 바 아이템(위치랑, 추가)
// 리스트 뷰 자체에 들어가도록 버튼 달기
//

struct LobbyView: View {
    // var roomStore = RoomStore()
    @State private var selectedDate: Int = 0

    var body: some View {
        NavigationStack {
            
            ExtractedView(selectedDate: $selectedDate)
            
            VStack {
                
                Divider()
                
                List {
                    switch selectedDate {
                    case 0:
                        RoomView()
                        RoomView()
                        RoomView()
                        RoomView()
                    case 1:
                        RoomView()
                        RoomView()
                    case 2:
                        RoomView()
                        RoomView()
                        RoomView()
                    default:
                        RoomView()
                        RoomView()
                        RoomView()
                        RoomView()
                        RoomView()
                    }
                }
                .listStyle(.plain)
                
            }
                    
            Spacer()
        }
        .navigationTitle("메인 화면")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LobbyView()
    }
}

struct RoomView: View {
    @State private var nameText: String = "(서울) 화요일 경도 할사람"
    @State private var placeText: String = "양재 양재천 입구"
    @State private var categoryText: String = "운동 / 스포츠"
    @State private var ageText: String = "20대 초반"
    @State private var isParticipate: Bool = false
    @State private var timeText: String = "16:40"
    
    var body: some View {
        HStack {
            Image("StaticLogobyDesigner")
                .resizable()
                .frame(width: 60, height:  60)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1.5))
            
            VStack(alignment: .leading) {
                Text(nameText)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                
                HStack {
                    Image(systemName: "mappin")
                    
                    Text(placeText)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                    Text(timeText)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                }
                
                Text("# \(categoryText) | \(ageText)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            }
            
            Spacer()
            
            VStack() {
                
                if !isParticipate {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                } else {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                }
                
                Text("참가 (1/10)")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            }
        }
    }
}

struct ExtractedView: View {
    @Binding var selectedDate: Int
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            Button(action: {
                selectedDate = 0
            }) {
                VStack {
                    Text("월")
                        .font(.headline)
                    Text("19")
                        .font(.title)
                }
            }
            .frame(width: 70, height: 70)
            .background(selectedDate == 0 ? Color("MainColor") : Color.gray)
            .foregroundColor(Color.white)
            .clipShape(Circle())
            
            Button(action: {
                selectedDate = 1
            }) {
                VStack {
                    Text("화")
                        .font(.headline)
                    Text("20")
                        .font(.title)
                }
            }
            .frame(width: 70, height: 70)
            .foregroundColor(Color.white)
            .background(selectedDate == 1 ? Color("MainColor") : Color.gray)
            .clipShape(Circle())
            
            Button(action: {
                selectedDate = 2
            }) {
                VStack {
                    Text("수")
                        .font(.headline)
                    Text("21")
                        .font(.title)
                }
            }
            .frame(width: 70, height: 70)
            .foregroundColor(Color.white)
            .background(selectedDate == 2 ? Color("MainColor") : Color.gray)
            .clipShape(Circle())
            Spacer()
        }
    }
}
