//
//  ContentView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                LogoImageView()
                
                Spacer()
                Spacer()
                
                NavigationLink(destination: LoginView(), label: {
                    Text("로그인")
                        .modifier(ButtonTitle())
                })
                .modifier(ButtonFrame())
                
                NavigationLink(destination: SignupView(), label: {
                    Text("회원가입")
                        .modifier(ButtonTitle())
                })
                .modifier(ButtonFrame())
               
                Spacer()
                Spacer()
                
                VStack {
                    Image("btnG_official")
                        .resizable()
                        .scaledToFit()
                        .modifier(SocialLoginButtonFrame())
                    
                    Image("kakao_login_medium_narrow")
                        .resizable()
                        .scaledToFit()
                        .modifier(SocialLoginButtonFrame())
                    
                    Image("ios_light_sq_SI")
                        .resizable()
                        .scaledToFit()
                        .modifier(SocialLoginButtonFrame())
                }
                Spacer()
            }
        }
        .navigationTitle("")
    }
}

#Preview {
    ContentView()
}


struct ButtonTitle: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.semibold)
            .frame(width: screenWidth * 0.43, height: screenHeight * 0.05)
    }
}

struct ButtonFrame: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.5, height: screenHeight * 0.07)
            .background(Color("MainColor"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}

struct SocialLoginButtonFrame: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.6, height: screenHeight * 0.05)
    }
}

struct LogoImageView: View {
    var body: some View {
        Image("StaticLogobyDesigner")
            .resizable()
            .frame(width: 209, height: 210)
    }
}
