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
    // MARK: - Variables
    @State private var selectedDate: Int = 0
    @State private var timeInfo = "6:54:32"
    
    // MARK: - Body
    var body: some View {
        
        ButtonView(selectedDate: $selectedDate)
            .padding(10)
        
        VStack {
            
            Divider()
            
            VStack {
                Text("모임 폭파까지 남은 시간")
                Text(timeInfo)
                    .foregroundStyle(Color("MainColor"))
            }
            .font(.title3)
            .bold()
        
            Divider()
            
            ZStack {
                List {
                    switch selectedDate {
                    case 0:
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        
                    case 1:
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                    case 2:
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                    default:
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView()
                        })
                    }
                } // List
                .listStyle(.plain)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: CreateRoomView(), label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 70, height: 70)
                                .background(Color("MainColor"))
                                .foregroundColor(Color.white)
                                .clipShape(Circle())
                                .padding()
                        })
                    }
                }
            }
        } // VStack
        .navigationTitle("메인 화면")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "map.fill")
                        .foregroundStyle(Color("MainColor"))
                    Text("개포동")
                        .foregroundStyle(.black)
                }
            }
        }
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
                
                HStack(spacing: 0) {
                    Text("# \(categoryText) | \(ageText)")
                    Text(" | 90W")
                }
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

struct ButtonView: View {
    @Binding var selectedDate: Int
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            Button(action: {
                selectedDate = 0
            }) {
                VStack {
                    Text("오늘")
                        .font(.title2)
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
                    Text("내일")
                        .font(.title2)
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
                    Text("모레")
                        .font(.title2)
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


//Spacer()
//HStack {
//    Spacer()
//    NavigationLink(destination: CreateRoomView(), label: {
//        Image(systemName: "plus")
//            .font(.largeTitle)
//            .frame(width: 70, height: 70)
//            .background(Color("MainColor"))
//            .foregroundColor(Color.white)
//            .clipShape(Circle())
//            .padding()
//    })
//}
