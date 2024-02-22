//
//  DetailRoomView.swift
//  StaticProject
//
//  Created by 최준영 on 2/20/24.
//

import SwiftUI

struct DetailRoomView: View {
    
    @State var isLiked: Bool = false
    @State var isLikedNum: Int = 99
    
    var room: Room = Room(
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
    )
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "figure.run")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 200, alignment: .center)
                        .padding(.horizontal, 50)
                        .overlay(RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 4))
                }
                Spacer()
                
                
                Text("(서울) 화요일 경도할 사람~ ")
                // Text("\(room.title)")
                    .font(.system(size: 23))
                    .frame(width: 360, height: 40, alignment: .leading)
                
                HStack {
                    Text("# 운동/스포츠")
                    // Text("# \(room.category.rawValue)")
                        .font(.system(size: 12))
                        .frame(width: 180, height: 25, alignment: .leading)
                        .foregroundColor(.gray)
                    Text("현재 인원 5/10")
                    // Text("현재 인원 \(room.numberOfParticipants)/\(room.limitOfParticipants)")
                        .font(.system(size: 15))
                        .frame(width: 150, height: 25, alignment: .trailing)
                }
                
                HStack {
                    Text("위치")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .frame(width: 178, height: 25, alignment: .leading)
                    Image(systemName: "mappin.circle")
                        .tint(Color("MainColor"))
                        .foregroundColor(.gray)
                    Text("서울시 서초구 양재동")
                    // Text("\(room.location)")
                }
                
                HStack {
                    Text("날짜 및 시간")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .frame(width: 210, height: 25, alignment: .leading)
                    Text("2024.02.22 16:40")
                    // Text("\(room.dateString) \(room.timeString)")
                }
                
                HStack {
                    Text("참여 조건")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .frame(width: 182, height: 25, alignment: .leading)
                    Text("20대")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(red: 0.75, green: 0.75, blue: 0.75))
                        .cornerRadius(10)
                    Text("30대")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(red: 0.75, green: 0.75, blue: 0.75))
                        .cornerRadius(10)
                    Text("남성")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(red: 0.75, green: 0.75, blue: 0.75))
                        .cornerRadius(10)
                    }
                }
                
                
                Divider()
                
                
                Text("모임 소개")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                
                    .padding()
                Text("""
                     
                       안녕하세요 😉
                       1시간 내로 가볍게 양재동 놀이터에서
                       경도할 사람을 모집합니다.
                       신체 건강한 분들 다 덤비세요.
                       야무지게 놀아봅시다. 👮🏻🚓🦹🏻‍♀️
                     """)
                .frame(width: 340, height: 200, alignment: .topLeading)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5))
            }
        participateRoomButtonView()
    }
}


// 하트 + 참여하기
struct participateRoomButtonView: View {
    
    @State var isLiked: Bool = false
    @State var isLikedNum: Int = 99
    
    var body: some View {
        HStack {
            Button {
                // 참여하기 버튼 클릭 시 기능 구현
                 //room.participants.append(UserStore.SampleUser(index: 0))
            } label: {
                Text("참여하기")
                    .frame(width: 310, height: 40, alignment: .center)
                    .bold()
            }
            .buttonStyle(.borderedProminent)
        }
        .tint(Color("MainColor"))
    }
}





#Preview {
    DetailRoomView(room:
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
                    )
    )
}
