//
//  ExploreView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""

    let roomStore: RoomStore = RoomStore()
    let lazyHGridRow: [GridItem] = [.init(.fixed(130.0)), .init(.fixed(130.0))]
    
    var body: some View {
        
        NavigationView{
            List {
                
                HStack(spacing: 40.0) {
                    Spacer()
                    DateButton()
                    DateButton()
                    DateButton()
                    Spacer()
                }
                
                ScrollView(.horizontal, content: {
                    LazyHGrid(rows: lazyHGridRow, content: {
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                        CategoryButton()
                    })
                })
                .scaledToFit()
                
                ForEach(roomStore.allRooms, content: { room in
                    Label("\(room.title)", systemImage: "photo")
                })
            }
            .navigationTitle("탐색")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
        .searchable(text: $searchText)
        .keyboardShortcut(.escape)
        .onSubmit(of: .search) {
            print("\(searchText)")
            // UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        }
    }
}

struct DateButton: View {
    var body: some View {
        Button(action: {
            print("날짜 버튼 눌림")
        }, label: {
            VStack {
                Text("월")
                Text("19")
                    .bold()
            }
            .frame(width: 60.0, height: 60.0)
            .foregroundColor(Color.white)
            .background(Color("MainColor"))
            .clipShape(.circle)
        })
    }
}

struct CategoryButton: View {
    var body: some View {
        Button(action: {
            print("카테고리 버튼 눌림")
        }, label: {
            VStack {
                Image(systemName: "airplane.departure")
                    .frame(width: 90.0, height: 90.0)
                    .background(Color.gray)
                    .clipShape(.buttonBorder)
                Text("문화/공연/여행")
            }
        })
    }
}


#Preview {
    ExploreView()
}
