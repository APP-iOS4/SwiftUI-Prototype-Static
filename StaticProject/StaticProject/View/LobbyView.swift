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
        
        DateButtonView(selectedDate: $selectedDate)
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
