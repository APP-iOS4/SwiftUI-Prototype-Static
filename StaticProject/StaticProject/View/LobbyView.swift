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
    @State private var isModalPresenting: Bool = false
    let myTimer: RoomTimer = RoomTimer()
    private var roomStore = RoomStore()
    
    // MARK: - Body
    var body: some View {
        
        DateButtonView(selectedDate: $selectedDate)
            .padding(10)
        
        VStack {
            
            Divider()
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("모임 폭파까지 남은 시간")
                    Image(systemName: "alarm.waves.left.and.right.fill")
                    Spacer()
                }
                // TODO: - Time 변경
                //Text("6:54:01")
                Text("\(myTimer.distanceWithNowAndToday)")
                    .foregroundStyle(Color("MainColor"))
            }
            .fontWeight(.bold)
            
            Divider()
            
            ZStack {
                List {
                    switch selectedDate {
                    case 0:
                        let todayRooms = roomStore.allRooms.filter { room in
                            room.dateString ==  "2024-02-21"
                        }
                        
                        
                        ForEach(todayRooms) { todayRoom in
                            NavigationLink(destination: DetailRoomView(), label: {
                                RoomView(room: todayRoom)
                            })
                        }
                        
                    case 1:
                        let tomorrowRooms = roomStore.allRooms.filter { room in
                            room.dateString ==  "2024-02-22"
                        }
                        
                        ForEach(tomorrowRooms) { tomorrowRoom in
                            NavigationLink(destination: DetailRoomView(), label: {
                                RoomView(room: tomorrowRoom)
                            })
                        }
                    case 2:
                        let totomorrowRooms = roomStore.allRooms.filter { room in
                            room.dateString ==  "2024-02-23"
                        }
                        
                        ForEach(totomorrowRooms) { totomorrowRoom in
                            NavigationLink(destination: DetailRoomView(), label: {
                                RoomView(room: totomorrowRoom)
                            })
                        }
                    default:
                        ForEach(roomStore.allRooms) { room in
                            NavigationLink(destination: DetailRoomView(), label: {
                                RoomView(room: room)
                            })
                        }
                    }
                } // List
                .listStyle(.plain)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            isModalPresenting = true
                        }, label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 70, height: 70)
                                .background(Color("MainColor"))
                                .foregroundColor(Color.white)
                                .clipShape(Circle())
                                .padding()
                        })
                        .sheet(isPresented: $isModalPresenting, content: {
                            CreateRoomView()
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


