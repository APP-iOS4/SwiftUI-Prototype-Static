//
//  MainView.swift
//  StaticProject
//
//  Created by Kang on 2/20/24.
//

import SwiftUI

struct MainView: View {
    // MARK: - Variables
    @State private var selectedTabIndex: Int = 0
    @State private var isLogIn: Bool = false
    
    // MARK: - Body
    var body: some View {
        
        if !isLogIn {
            ContentView(isLogin: $isLogIn)
        } else {
            TabView(selection: $selectedTabIndex) {
                NavigationStack {
                    LobbyView()
                }
                .tabItem {
                    Label("메인화면", systemImage: "house.fill")
                }
                .tag(0)
                
                NavigationStack {
                    ExploreView()
                }
                .tabItem {
                    Label("탐색", systemImage: "magnifyingglass")
                }
                .tag(1)
                
                NavigationStack {
                    ParticipateView()
                }
                .tabItem {
                    Label("참가한 방", systemImage: "star.fill")
                }
                .tag(2)
                
                NavigationStack {
                    AccountView()
                }
                .tabItem {
                    Label("내 계정", systemImage: "person")
                }
                .tag(3)
            }
            .tint(Color("MainColor"))
        }
    }
}

#Preview {
    MainView()
}
