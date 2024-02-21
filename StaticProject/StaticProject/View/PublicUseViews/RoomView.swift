//
//  RoomView.swift
//  StaticProject
//
//  Created by 이선준 on 2/21/24.
//

import SwiftUI

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
