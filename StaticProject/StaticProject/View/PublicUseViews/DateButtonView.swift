//
//  ButtonView.swift
//  StaticProject
//
//  Created by 이선준 on 2/21/24.
//

import SwiftUI

struct DateButtonView: View {
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

#Preview {
    DateButtonView(selectedDate: .constant(0))
}
