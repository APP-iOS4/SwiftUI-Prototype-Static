//
//  DateButtonView2.swift
//  StaticProject
//
//  Created by 이선준 on 2/22/24.
//

import SwiftUI

struct DateButtonView2: View {
    @Binding var selectedDateTag: DateCases
    
    let roomStore: RoomStore
    
    let dateTag: DateCases
    var dateButtonString: String {
        if dateTag == .Today {
            return "오늘"
        } else if dateTag == .Tomorrow {
            return "내일"
        } else {
            return "모레"
        }
    }
    var selectedDate: String {
        let todayDate = Date()
        let calculatedDate = Calendar.current.date(byAdding: .day, value: dateTag.rawValue, to: todayDate) ?? todayDate
    
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: calculatedDate)
    }
    
    var body: some View {
        Button(action: {
            roomStore.selectedDate = selectedDate
            selectedDateTag = dateTag
            print("selectedDateTag: \(selectedDateTag)")
            print("roomStore에 selectedDate인 \(selectedDate) 넣음")
        }) {
            VStack {
                Text("\(dateButtonString)")
                    .font(.title2)
            }
        }
        .frame(width: 70, height: 70)
        .background(selectedDateTag == dateTag ? Color("MainColor") : Color.gray)
        .foregroundColor(Color.white)
        .clipShape(Circle())
    }
}

#Preview {
    DateButtonView2(selectedDateTag: .constant(DateCases.Today), roomStore: RoomStore(), dateTag: .Today)
}
