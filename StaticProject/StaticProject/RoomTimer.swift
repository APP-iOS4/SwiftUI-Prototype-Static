//
//  Timer.swift
//  StaticProject
//
//  Created by 이선준 on 2/21/24.
//

import Foundation
import Observation

@Observable
class RoomTimer: ObservableObject {
    var now: Date = Date()
    
    var endOfToday: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateFormatter.string(from: now)
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let tempDate: Date = dateFormatter.date(from: "\(dateString) 23:59:59") ?? Date()
        
        return tempDate
    }
    
    var distanceWithNowAndToday: String {
        let distance: DateComponents = Calendar.current.dateComponents([.hour, .minute, .second], from: now, to: endOfToday)

        return "\(distance.hour ?? 0):\(distance.minute ?? 0):\(distance.second ?? 0)"
    }
    
    init() {
        //간격        //반복되기때문에 true   //timer을 in 해준다.
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.now = Date()
        }
    }
}
