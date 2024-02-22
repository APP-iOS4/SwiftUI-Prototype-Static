//
//  exitRoomView.swift
//  StaticProject
//
//  Created by 최준영 on 2/21/24.
//

import SwiftUI

struct ExitRoomView: View {

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
        ExitRoomButtonView()
    }
}

//(톡방, 나가기 뷰)
struct ExitRoomButtonView: View {
    
    // @Environment(\.presentationMode) var presentation
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            NavigationLink(destination: TalkView(), label: {
                Image(systemName: "message")
                    .resizable()
            })
            .frame(width: 40, height: 40, alignment: .center)
            .padding(.trailing, 7)
            .tint(Color("MainColor"))
            
            Button {
                // 나가기 버튼 클릭 시 기능 구현
                // presentation.wrappedValue.dismiss()
                showingAlert.toggle()
            } label: {
                Text("나가기")
                    .frame(width: 250, height: 40, alignment: .center)
                    .bold()
            }
            .tint(Color("MainColor"))
            
            .buttonStyle(.borderedProminent)
            .alert("모임을 나가시겠습니까?", isPresented: $showingAlert) {
                Button("나가기", role: .destructive) {
                   
                }
            }
        }
    }
}
    #Preview {
    NavigationStack{ ExitRoomView() }
}
