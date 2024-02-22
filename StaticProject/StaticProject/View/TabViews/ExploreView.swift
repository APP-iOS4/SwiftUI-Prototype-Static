//
//  ExploreView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct ExploreView: View {
    
    let user: User = UserStore.SampleUser(index: 0)
    
    @State private var searchText: String = ""              // 검색어 변수
    @State private var selectedDateTag: DateCases = .Today  // 날짜 선택 변수
    @State private var selectedOnOfflineCases: OnOfflineCases = .Both
    @State private var selectedCategory: Category? = nil    // 카테고리 선택
    
    @State private var checkIsOnline: Bool = false
    
    let roomStore: RoomStore = RoomStore()
    let lazyHGridRow: [GridItem] = [.init(.fixed(130.0)), .init(.fixed(130.0))]
    
    init() {
        let todayDate = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        roomStore.selectedDate = dateFormatter.string(from: todayDate)
    }
    
    var body: some View {
        NavigationStack {
            
            Divider()
            
            HStack(spacing: 30) {
                Spacer()
                DateButtonView2(selectedDateTag: $selectedDateTag, roomStore: roomStore, dateTag: .Today)
                DateButtonView2(selectedDateTag: $selectedDateTag, roomStore: roomStore, dateTag: .Tomorrow)
                DateButtonView2(selectedDateTag: $selectedDateTag, roomStore: roomStore, dateTag: .DayAfterTomorrow)
                Spacer()
            }
            
//            List {
                RoomBombTimerView()
                
                Picker("Which one you want to see?", selection: $selectedOnOfflineCases) {
                    ForEach(OnOfflineCases.allCases, id: \.self) {
                        Text("\($0.rawValue)")
                    }
                }
                .pickerStyle(.segmented)
                .colorMultiply(Color("MainColor"))
                .onChange(of: selectedOnOfflineCases, {
                    roomStore.selectedOnOfflineCase = selectedOnOfflineCases
                })
                
                Divider()
                
            // MARK: -
//                ScrollView(.horizontal, content: {
//                    LazyHGrid(rows: lazyHGridRow, content: {
//                        ForEach(Category.allCases, id: \.self,  content: { category in
//                            CategoryBoxButtonView(selectedCategory: $selectedCategory, roomStore: roomStore, category: category)
//                        })
//                    })
//                })
//                .scaledToFit()
                
            
            // MARK: -
            
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80.0, maximum: 180.0))], content: {
                    ForEach(Category.allCases, id: \.self, content: { category in
                        Button(action: {
                            if selectedCategory == category {
                                selectedCategory = nil
                            } else {
                                selectedCategory = category
                            }
                            roomStore.selectedCategory = selectedCategory
                        }, label: {
                            Text("\(category.rawValue)")
                                .font(.system(size: 15))
                                .frame(width:80, height: 35)
                                .background(selectedCategory == category ? Color("MainColor") : Color(UIColor.systemBackground))
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color(.black), lineWidth: 1.5))
                                .cornerRadius(50)
                        })
                    })
                    .padding(.horizontal)
                })
                .padding(.bottom, 15)
                
            // MARK: ---
               
                // Divider()
                List {
                if roomStore.filteredSearchRooms.isEmpty {
                    VStack(alignment: .center) {
                        HStack {
                            Spacer()
                            LogoImageView()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("검색된 방이 없습니다.")
                            Spacer()
                        }
                    }
                } else {
                    ForEach(roomStore.filteredSearchRooms, content: { room in
                        NavigationLink(destination: DetailRoomView(), label: {
                            RoomView(room: room)
                        })
                    })
                }
            }
            .searchable(text: $searchText)
            .keyboardShortcut(.escape)
            .onSubmit(of: .search) {
                print("\(searchText)")
                // UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                roomStore.searchText = searchText
            }
        }
        .navigationTitle("탐색")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
