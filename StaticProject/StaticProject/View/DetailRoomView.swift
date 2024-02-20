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
    @State var isLikedNum: Int = 100
    
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
                        .border(Color.black, width: 4)
                        .cornerRadius(7)
                }
                Spacer()
                
                
                Text("(서울) 가볍게 산책 할 사람 모여라~ ")
                    .font(.system(size: 23))
                    .frame(width: 350, height: 40, alignment: .leading)
                
                Text("현재 인원 5/10")
                    .font(.system(size: 15))
                    .frame(width: 300, height: 25, alignment: .trailing)
                
                HStack {
                    Text("위치")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                    .frame(width: 142, height: 25, alignment: .leading)
                    Image(systemName: "mappin.circle")
                        .tint(Color("MainColor"))
                    Text("서울 종로구 창신동 청계천")
                }
                
                
                HStack {
                    Text("날짜 및 시간")
                        .font(.system(size: 17))
                        .frame(alignment: .leading)
                    .frame(width: 255, height: 25, alignment: .leading)
                Text("2024.02.22")
                }
                
                Text("참여 조건")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                
                    
                Divider()
                
                
                Text("모임 소개")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                
                    .padding()
                Text("""
                     안녕하세요 😉
                     1시간 내로 가볍게 청계천 산책할 사람을 모집합니다.
                     혼자 걷긴 쓸쓸하니 심심하지 않게 말동무나
                     하면서 가볍게 산책해 봅시다 🏃🏻🏃🏻‍♀️🏃🏻‍♂️
                     """)
                    .frame(width: 340, height: 200, alignment: .topLeading)
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
