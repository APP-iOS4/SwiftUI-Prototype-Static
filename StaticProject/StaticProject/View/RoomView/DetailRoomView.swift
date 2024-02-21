//
//  DetailRoomView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct DetailRoomView: View {
    @State var roomIntroduce: String = ""
    @State var roomName: String = ""
    @State var roomParty: String = ""
    
    @State private var roomDate = Date()
    
    
    let categories = ["운동", "음악", "맛집", "문화", "게임","소통"]
    let personnel = ["5명", "10명", "20명", "100명"]
    
    @State private var selectedCategory = ""
    @State private var selectedPersonnel = ""
    
    @State var isLiked: Bool = false
    @State var isLikedNum: Int = 99
    
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
                    .font(.system(size: 23))
                    .frame(width: 360, height: 40, alignment: .leading)
                
                HStack {
                    Text("# 운동/스포츠")
                        .font(.system(size: 12))
                        .frame(width: 180, height: 25, alignment: .leading)
                        .foregroundColor(.gray)
                    Text("현재 인원 5/10")
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
                }
                
                HStack {
                    Text("날짜 및 시간")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                        .frame(width: 210, height: 25, alignment: .leading)
                    Text("2024.02.22 16:40")
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
        }
        // 위 친구들을 스크롤 뷰로 구현 예정
        
        HStack {
            Button {
                isLiked.toggle()
                if isLiked {
                    isLikedNum += 1
                } else {
                    isLikedNum -= 1
                }
            } label: {
                if isLiked {
                    VStack {
                        Text(Image(systemName: "heart.fill"))
                        Text("\(isLikedNum)")
                    }
                } else {
                    VStack {
                        Text(Image(systemName: "heart"))
                        Text("\(isLikedNum)")
                    }
                }
            }
            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Button {
                // 생성하기 버튼 클릭 시 기능 구현
            } label: {
                Text("참여하기")
                    .frame(width: 250, height: 40, alignment: .center)
                    .bold()
            }
            .buttonStyle(.borderedProminent)
        }
        .tint(Color("MainColor"))
    }
}


#Preview {
    DetailRoomView()
}
