//
//  CreateRoomView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct CreateRoomView: View {
    @State var roomIntroduce: String = ""
    @State var roomTag: String = ""
    @State var roomName: String = ""
    @State var roomParty: String = ""
    @State var personnel: Int = 0
    
    @State private var roomDate = Date()
    
    let categories = ["운동", "음악", "맛집", "문화", "게임","소통"]
    
    @State private var selectedCategory = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack(alignment: .bottomTrailing) {
                    Image("StaticLogobyDesigner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 200, alignment: .center)
                        .padding(.horizontal, 50)
                        .overlay(RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 4))
                    
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
                
                
                    .padding()
                HStack {
                    Text("모임 이름")
                        .font(.system(size: 17))
                        .padding(.leading,24)
                    Spacer()
                }
                
                TextField(text: $roomName) {
                    Text(" 모임의 이름을 입력하여 주세요.")
                }
                .frame(width: 360, height: 30, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5))
                
                .padding(.bottom, 20)
                
//                Picker("종류를 선택하세요.", selection: $selectedCategory) {
//                    ForEach(categories, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .pickerStyle(.palette)
//                .background()
//                .padding(.bottom, 20)
                
                
                HStack {
                    Text("인원")
                        .font(.system(size: 17))
                        .padding(.leading,24)
                    
                    
                    Spacer()
                    Button{
                        if personnel > 0 {
                            personnel -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 27.0, height: 27.0)
                            .tint(Color("MainColor"))
                    }
                    
                    Text("\(personnel)")
                        .font(.title3)
                        
                    
                    Button{
                        personnel += 1
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 27.0, height: 27.0)
                            .tint(Color("MainColor"))
                    }
                    
                }
                .padding(.trailing, 45)
                .padding(.bottom, 25)

                
                HStack {
                    Text("날짜 및 시간")
                        .font(.system(size: 17))
                        .padding(.leading,24)
                        
                    
                    
                    DatePicker("", selection: $roomDate)
                        .frame(height: 24, alignment: .center)
                        .padding(.trailing, 24)
                    //날짜 없애고 시간만???
                }
                .padding(.bottom, 25)
                
                HStack {
                    Text("종류")
                        .font(.system(size: 17))
                        .padding(.leading,24)
                    Spacer()
                }
                
                Grid {
                    GridRow {
                        Button {
                            
                        } label: {
                            Text("운동/헬스")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("독서")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("음악/악기")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("드라이브")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("여행")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("공부")
                        }
                        
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5))
                    GridRow {
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("문화/예술")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("언어")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("맛집투어")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("봉사활동")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("산책")
                        }
                        
                        Button {
                            // 색 변환 기능 구현
                        } label: {
                            Text("소통")
                        }
                    }
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.5))
                    .padding(.bottom, 10)
                }
            
                
                Divider()
                
                HStack {
                    Text("모임 소개")
                        .font(.system(size: 17))
                        .padding(.leading,26)
                    Spacer()
                }
                .padding(.top, 5)
                .padding(.bottom, -12)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $roomIntroduce)
                        .frame(height: 100, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5))
                        .padding()
                    if roomIntroduce.isEmpty {
                        Text("모임의 소개를 입력하여 주세요.")
                            .foregroundColor(.gray)
                            .frame(width: 250, height: 80, alignment: .topLeading)
                            .padding(.leading, 25)
                            .padding(.top, 25)
                    }
                }
                
                HStack {
                    Text("#태그")
                        .font(.system(size: 17))
                        .padding(.leading,26)
                    
                    Spacer()
                }
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $roomTag)
                        .frame(width: 360, height: 40, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5))
                        
                    if roomTag.isEmpty {
                        Text("# 모임의 태그를 입력하여 주세요.")
                            .foregroundColor(.gray)
                            .frame(width: 250, height: 40, alignment: .topLeading)
                            .padding(.leading, 15)
                            .padding(.top, 8)
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
