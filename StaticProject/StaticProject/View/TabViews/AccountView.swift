//
//  AccountView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

//@State private var selection = 0

struct AccountView: View {
    
    var body: some View {
        
//        Text("내 계정")
//            .font(.title)
//            .padding()
        Divider()
        // Spacer()
        VStack {
            
            HStack {
                Image("StaticLogobyDesigner")
                    .resizable()
                    .frame(width: 120,height: 120)
                    .border(Color.black, width: 4)
                    .cornerRadius(7)
                    .padding()
                VStack{
                    Text("익명의 이름")
                        .font(.title)
                    Text("서울특별시 개포동")
                    .font(.callout)}
                Spacer()
            }
            
            HStack(spacing:100) {
                Text("정전기 지수")
                    .font(.title)
                Text("100W")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)}
                Divider()
                // Spacer()
            
            Text("정전기 지수가 낮으면 사람들과 연결되기 힘들거에요!\n 낮아지지 않도록 매너있게 행동합시다!")
                .font(.callout)
                .frame(width: 400, height: 70)
                .multilineTextAlignment(.center)
                .background(Color(UIColor.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
    //            .background(.)
            Spacer()
            
        }
        .navigationTitle("내 계정")
        .navigationBarTitleDisplayMode(.inline)
        
                
    }
    
//            TabView(selection: $selection) {
//                Text("")
//                    .tabItem {
//                        Image(systemName: "house.fill")
//                        Text("메인화면")
//                    }.tag(0)
//                Text("")
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("검색")
//                    }.tag(1)
//                Text("")
//                    .tabItem {
//                        Image(systemName: "star.fill")
//                        Text("참가한방")
//                    }.tag(2)
//                Text("")
//                    .tabItem {
//                        Image(systemName: "person.crop.circle")
//                        Text("내 계정")
//                    }.tag(3)
//            }
//                    .font(.headline)
}





#Preview {
    NavigationStack {
        AccountView()
    }
}
