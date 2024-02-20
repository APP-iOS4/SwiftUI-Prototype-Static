//
//  LobbyView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct LobbyView: View {
    var body: some View {
        NavigationStack {

            VStack {
                HStack {
                    Image(nam)
                }
                Text("(서울) 화요일 경도 할사람~")
                Text("양재 양재천 입구")
                Text("#운동 / 스포츠 | 20대 초반")
            }
                    
            Spacer()
        }
        .navigationTitle("메인 화면")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LobbyView()
    }
}
