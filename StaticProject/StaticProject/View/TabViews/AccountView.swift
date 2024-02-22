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
            
            HStack(spacing:150) {
                Text("찌리릿 호감도")
                    .font(.title)
                Text("100W")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)}
                Divider()
                // Spacer()
            
            Text("메너가 낮아지면 연결이 살짝 연결이 쉽지 않아요!\n 메너가 올라가면 찌리릿이 신이나서 배불러요.^^\n 찌리릿 호감도가 올라갈수록 찌리릿 굿즈가 기다리고 있어요.")
                .font(.callout)
                .frame(width: 400, height: 80)
                .multilineTextAlignment(.center)
                .background(Color(UIColor.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
    //            .background(.)
            Spacer()
            
        }
        .navigationTitle("내 계정")
        .navigationBarTitleDisplayMode(.inline)
        
                
    }
    
}





#Preview {
    NavigationStack {
        AccountView()
    }
}
