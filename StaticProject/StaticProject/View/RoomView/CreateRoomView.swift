//
//  CreateRoomView.swift
//  StaticProject
//
//  Created by 최준영 on 2/20/24.
//

import SwiftUI

struct CreateRoomView: View {
    @State private var roomIntroduce: String = ""
    @State private var roomTag: String = ""
    @State private var roomName: String = ""
    @State private var roomParty: String = ""
    @State private var personnel: Int = 0
    @State private var selectedCategory = ""
    @State private var roomDate = Date()
    @Environment(\.presentationMode) var presentation
    
    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: .minimum(80, 80), maximum: .maximum(80, 80))),
        GridItem(.flexible(minimum: .minimum(80, 80), maximum: .maximum(80, 80))),
        GridItem(.flexible(minimum: .minimum(80, 80), maximum: .maximum(80, 80))),
        GridItem(.flexible(minimum: .minimum(80, 80), maximum: .maximum(80, 80)))
    ]
    
    let categories = [
        "운동/헬스", "독서", "음악/악기", "드라이브", "여행", "공부", "문화/예술", "언어", "맛집투어", "봉사활동", "산책", "소통"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 60)
                
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
                        .padding(.horizontal)
                    
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
                
                
                LazyVGrid(columns: columns,  spacing: 6) {
                    ForEach(categories, id: \.self) { category in
                        Button(role: .destructive) {
                            selectedCategory = category
                        } label: {
                            VStack {
                                Text(category)
                                    .font(.system(size: 15))
                                    .frame(width:80, height: 35)
                                    .background(selectedCategory == category ? Color("MainColor") : .white)
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 100)
                                            .stroke(Color(.gray), lineWidth: 1.5))
                                    .cornerRadius(50)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 15)
                
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
            .onTapGesture {
                self.endTextEditing()
            }
        }
        // 위 친구들을 스크롤 뷰로 구현 예정
        
        HStack {
            Button {
                presentation.wrappedValue.dismiss()
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

extension CreateRoomView {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}

#Preview {
    CreateRoomView()
}
