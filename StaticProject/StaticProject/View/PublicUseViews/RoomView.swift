//
//  RoomView.swift
//  StaticProject
//
//  Created by 이선준 on 2/21/24.
//

import SwiftUI

struct RoomView: View {
    @State private var isParticipate: Bool = false
    let user: User = UserStore.SampleUser(index: 0)
    var room: Room
    
    var body: some View {
        HStack {
            Image("StaticLogobyDesigner")
                .resizable()
                .frame(width: 60, height:  60)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1.5))
            
            VStack(alignment: .leading) {
                Text(room.title)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                
                HStack {
                    Image(systemName: "mappin")
                    
                    Text(room.location)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                    Text(room.timeString)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                }
                
                HStack(spacing: 0) {
                    Text("# \(room.category.rawValue) | \(room.ageLimit.rawValue)")
                    // TODO: - "90W" 수정
                    Text(" | \(room.wattLimit)W")
                }
                .font(.footnote)
                .foregroundStyle(.gray)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
            }
            
            Spacer()
            
            VStack() {
                // TODO: - "isParticipate"로 나뉘는 거 수정
                if room.isParticipateRoom(user: user) {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                } else {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                }
                
                // TODO: - "참가" 부분 수정
                Text("참가 (\(room.numberOfParticipants)/\(room.limitOfParticipants))")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            }
        }
    }
}

#Preview {
    RoomView(room: RoomStore().allRooms.first!)
}
