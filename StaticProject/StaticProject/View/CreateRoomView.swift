//
//  CreateRoomView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct CreateRoomView: View {
    @State var roomIntroduce: String = ""
    @State var roomName: String = ""
    @State var roomParty: String = ""
    
    @State private var roomDate = Date()
    
    
    let categories = ["운동", "음악", "맛집", "문화", "게임","소통"]
    let personnel = ["5명", "10명", "20명", "100명"]
    
    @State private var selectedCategory = ""
    @State private var selectedPersonnel = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    Image("StaticLogobyDesigner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 200, alignment: .center)
                        .padding(.horizontal, 50)
                        .border(Color.black, width: 4)
                        .cornerRadius(7)
                    
                    Button {
                        // 사진 추가하는 기능
                    } label: {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .padding()
                    }
                    .tint(Color("MainColor"))
                }
                Spacer()
                
                
                Text("모임 이름")
                    .font(.system(size: 17))
                    .frame(width: 350, height: 25, alignment: .leading)
                TextField(text: $roomName) {
                    Text("모임 이름을 입력하여 주세요.")
                }
                .frame(width: 350, height: 30, alignment: .center)
                .border(Color.gray, width: 0.5)
                
                
                Text("종류")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                Picker("종류를 선택하세요.", selection: $selectedCategory) {
                    ForEach(categories.indices, id: \.self) {
                        Text(self.categories[$0])
                    }
                }
                .pickerStyle(.palette)
                
                
                Text("인원")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                Picker("인원을 선택하세요.", selection: $selectedPersonnel) {
                    ForEach(personnel.indices, id: \.self) { index in
                        Text(self.personnel[index])
                    }
                }
                .pickerStyle(.palette)
                
                
                Text("날짜 및 시간")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                
                DatePicker("", selection: $roomDate)
                    .frame(width: 1, height: 50, alignment: .center)
                //날짜 없애고 시간만???
                
                Divider()
                
                Text("모임 소개")
                    .font(.system(size: 17))
                    .frame(alignment: .leading)
                    .frame(width: 350, height: 25, alignment: .leading)
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $roomIntroduce)
                        .frame(width: 340, height: 100, alignment: .center)
                        .border(Color.gray, width: 0.5)
                        .padding()
                    if roomIntroduce.isEmpty {
                        Text("모임의 소개를 적어주세요.")
                            .foregroundColor(.gray)
                            .frame(width: 200, height: 100, alignment: .topLeading)
                            .padding(.leading, 25)
                            .padding(.top, 25)
                    }
                }
            }
        }
        // 위 친구들을 스크롤 뷰로 구현 예정
        
        HStack {
            Button {
                // 생성하기 버튼 클릭 시 기능 구현
            } label: {
                Text("생성하기")
                    .frame(width: 350, height: 40, alignment: .center)
                    .bold()
            }
            .buttonStyle(.borderedProminent)
        }
        .tint(Color("MainColor"))
    }
}


#Preview {
    CreateRoomView()
}
