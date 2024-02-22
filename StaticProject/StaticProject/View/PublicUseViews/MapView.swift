//
//  MapView.swift
//  StaticProject
//
//  Created by Kang on 2/22/24.
//

import SwiftUI

struct MapView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("지도에서 위치 설정")
                .padding(36)
                .bold()
            
            Image("FatDog")
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 550)
            
            
            Button(action: {
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("이 위치로 주소 설정")
                    .frame(width: 280, height: 48)
                    .background(Color("MainColor"))
                    .cornerRadius(8)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
            })
            .padding(40)
            
            Spacer()
        }
    }
}

#Preview {
    MapView()
}
