//
//  RoomBombTimerView.swift
//  StaticProject
//
//  Created by 이선준 on 2/22/24.
//

import SwiftUI

struct RoomBombTimerView: View {
    let roomBombTimer: RoomTimer = RoomTimer()
    
    var body: some View {
        // 모임 폭파 알림 뷰
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Spacer()
                Text("모임 폭파까지 남은 시간")
                Image(systemName: "alarm.waves.left.and.right.fill")
                    .foregroundStyle(Color("MainColor"))
                Spacer()
            }
            Text("\(roomBombTimer.distanceWithNowAndToday)")
                .foregroundStyle(Color("MainColor"))
        }
        .fontWeight(.bold)
    }
}

#Preview {
    RoomBombTimerView()
}
