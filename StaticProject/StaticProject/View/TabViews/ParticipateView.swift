//
//  ParticipateView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct ParticipateView: View {
    
    let user: User?
    let roomStore: RoomStore = RoomStore()
    
    var filteredParticipatedRooms: [Room] {
        if let user {
            return roomStore.allRooms.filter({
                $0.isParticipateRoom(user: user)
            })
        } else {
            return []
        }
    }
    
    var body: some View {
            //        Text("참여한 방")
            //            .font(.title)
            //            .padding()
            Divider()
            //        LogoImageView()
            //        Text("참여하신 방이 없습니다.")
            Spacer()
            
            if filteredParticipatedRooms.isEmpty {
                LogoImageView()
                Text("참여하신 방이 없습니다.")
            } else {
                List {
                    ForEach(filteredParticipatedRooms, content: { room in
                        NavigationLink(destination: {
                             ExitRoomView()
                            //DetailRoomView()
                        }, label: {
                            RoomView(room: room)
                        })
                    })
                }
                .listStyle(.plain)
                .navigationTitle("내가 참여한 방")
                .navigationBarTitleDisplayMode(.inline)
            }
            Spacer()
    }
}

#Preview {
    NavigationStack {
        ParticipateView(user: UserStore.SampleUser(index: 0))
        //     ParticipateView(user: nil)
    }
}
