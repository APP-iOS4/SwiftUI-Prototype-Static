//
//  ExploreView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct ExploreView: View {
    
    let user: User = UserStore.SampleUser(index: 0)
    let myTimer: MyTimer = MyTimer()
    
    @State private var selectedDateTag: DateCase = .Today
    @State private var searchText: String = ""
    @State private var selectedCategory: Category? = nil
    @State private var checkIsOnline: Bool = false
    @State private var isShowingCreateRoomView: Bool = false
    
    let roomStore: RoomStore = RoomStore()
    let lazyHGridRow: [GridItem] = [.init(.fixed(130.0)), .init(.fixed(130.0))]
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List {
                    
                    HStack(spacing: 40.0) {
                        Spacer()
                        DateButtonView(selectedDateTag: $selectedDateTag, tag: .Today)
                        DateButtonView(selectedDateTag: $selectedDateTag, tag: .Tomorrow)
                        DateButtonView(selectedDateTag: $selectedDateTag, tag: .DayAfterTomorrow)
                        Spacer()
                    }
                    
                    VStack(alignment: .center) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("모임 폭파까지 남은 시간")
                            Image(systemName: "alarm.waves.left.and.right.fill")
                            Spacer()
                        }
                        // TODO: - Time 변경
                        //Text("6:54:01")
                        Text("\(myTimer.distanceWithNowAndToday)")
                            .foregroundStyle(Color("MainColor"))
                    }
                    .fontWeight(.bold)
                    
                    
                    // 온라인 vs 오프라인 1번 방법
                        Toggle(isOn: $checkIsOnline, label: {
                            checkIsOnline ? Text("온라인") : Text("오프라인")
                        })
                        .toggleStyle(.switch)
                        .onChange(of: checkIsOnline, {
                            roomStore.checkIsOnline = checkIsOnline
                        })
                    
                    
                    ScrollView(.horizontal, content: {
                        LazyHGrid(rows: lazyHGridRow, content: {
                            ForEach(Category.allCases, id: \.self,  content: { category in
                                CategoryButton(selectedCategory: $selectedCategory, roomStore: roomStore, category: category)
                            })
                        })
                    })
                    .scaledToFit()
                    
                    ForEach(roomStore.allRooms, content: { room in
                        TempRoomView(room: room)
                    })
                }
                .navigationTitle("탐색")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button(action: {
                            isShowingCreateRoomView.toggle()
                        }, label: {
                            Label("Add Room", systemImage: "plus")
                        })
                    })
                })
            }
            .searchable(text: $searchText)
            .keyboardShortcut(.escape)
            .onSubmit(of: .search) {
                print("\(searchText)")
                // UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                roomStore.searchText = searchText
            }
            
            
            // 여기가 온라인 오프라인 버튼임
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        checkIsOnline.toggle()
                        roomStore.checkIsOnline = checkIsOnline
                    }, label: {
                        Text(checkIsOnline ? "ON" : "OFF")
                    })
                    .frame(width: 70, height: 70)
                    .background(Color("MainColor"))
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                    .padding()
                }
            }
        }
        .sheet(isPresented: $isShowingCreateRoomView, content: {
            CreateRoomView()
        })
        
    }
}


enum DateCase: Int {
    case Today = 0
    case Tomorrow = 1
    case DayAfterTomorrow = 2
}

struct DateButtonView: View {
    @Binding var selectedDateTag: DateCase
    
    let tag: DateCase
    var week: String {
        let calculatedDate = Date(timeIntervalSinceNow: 86400 * Double(tag.rawValue)) //내일
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = "E"
        
        return dateFormatter.string(from: calculatedDate)
    }
    var date: String {
        let calculatedDate = Date(timeIntervalSinceNow: 86400 * Double(tag.rawValue)) //내일
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = "dd"
        
        return dateFormatter.string(from: calculatedDate)
    }
    
    var body: some View {
        Button(action: {
            selectedDateTag = tag
            print("selectedDateTag: \(selectedDateTag)")
        }) {
            VStack {
                Text("\(week)")
                    .font(.headline)
                Text("\(date)")
                    .font(.title)
            }
        }
        .frame(width: 70, height: 70)
        .background(selectedDateTag == tag ? Color("MainColor") : Color.gray)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .border(Color.black, width: 2)
    }
}


struct CategoryButton: View {
    @Binding var selectedCategory: Category?
    
    var currentColor: Color {
        selectedCategory == category ? Color("MainColor") : .black
    }
    
    let roomStore: RoomStore
    let category: Category
    
    var body: some View {
        Button(action: {
            if selectedCategory == category {
                selectedCategory = nil
            } else {
                selectedCategory = category
            }
            roomStore.selectedCategory = selectedCategory
            
            if let selectedCategory {
                print("selectedCategory: \(selectedCategory.rawValue)")
            } else {
                print("selectedCategory: nil")
            }
            
        }, label: {
            VStack {
                Image(systemName: "airplane.departure")
                    .frame(width: 90.0, height: 90.0)
                    .background(Color.gray)
                    .border(currentColor, width: 3)
                Text("\(category.rawValue)")
            }
        })
        .foregroundStyle(currentColor)
    }
}



// MARK: Temp
struct TempRoomView: View {
    let room: Room
    let user: User = UserStore.SampleUser(index: 0)
    
    // 건님 여기 있던거 없앴어요
    
    var body: some View {
        HStack {
            Image("StaticLogobyDesigner")
                .resizable()
                .frame(width: 60, height:  60)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1.5))
            
            VStack(alignment: .leading) {
                Text(room.title)
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                
                HStack {
                    Image(systemName: "mappin")
                    
                    Text(room.location)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                    Text(room.timeString)
                        .lineLimit(1)
                        .minimumScaleFactor(0.3)
                }
                
                HStack(spacing: 0) {
                    Text("# \(room.category.rawValue) | \(room.ageLimit.rawValue)")
                    // TODO: - "90W" 수정
                    Text(" | 90W")
                }
                .font(.footnote)
                .foregroundStyle(.gray)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
            }
            
            Spacer()
            
            VStack() {
                // TODO: - "isParticipate"로 나뉘는 거 수정
                if room.isParticipateRoom(user: user) {
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                } else {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("MainColor"))
                }
                
                // TODO: - "참가" 부분 수정
                Text("참가 (\(room.numberOfParticipants)/\(room.limitOfParticipants))")
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            }
        }
    }
}


#Preview {
    ExploreView()
}
