//
//  TalkView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/21/24.
//

import SwiftUI

struct TalkView: View {
    @State var message: String = ""
    @State var isEditing: Bool = false
    @State var sendMessageList: [Message] = []
    
    let messageStore: MessageStore = MessageStore()
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVStack(alignment: .leading, content: {
                    ForEach(messageStore.messages) { message in
                        Text("\(message.message)")                          .padding()
                            .foregroundStyle(Color(UIColor.systemBackground))
                            .background(Color(UIColor.systemGray2))
                            .cornerRadius(10)
                        Text("\(message.date)")
                            .font(.footnote)
                            .foregroundStyle(Color(UIColor.systemGray))
                    }
                    .padding(10)
                })
                
                LazyVStack(alignment: .trailing, content: {
                    ForEach(sendMessageList) { message in
                        Text("\(message.message)")
                            .padding()
                            .foregroundStyle(Color(UIColor.systemBackground))
                            .background(Color("MainColor"))
                            .cornerRadius(10)
                        Text("\(message.date)")
                            .font(.footnote)
                            .foregroundStyle(Color(UIColor.systemGray))
                    }
                    .padding(10)
                })
                
            }
            
            TextField("메세지를 입력해주세요.", text: $message)
                .onSubmit {
                    if !message.isEmpty {
                        sendMessageList.append(Message(message: message, date: "2024/02/22"))
                    }
                    message = ""
                }
                .font(.title3)
                .padding(3)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color(UIColor.systemGray5), lineWidth: 1)
                )
                .padding(10)

        }
        .navigationTitle("(서울) 화요일 경도할 사람 모여라!")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            self.endTextEditing()
        }
    }
    
}

#Preview {
    NavigationStack {
        TalkView()
    }
}

