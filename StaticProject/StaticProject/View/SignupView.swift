//
//  SignupView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct SignupView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    @State var loginError: String = "아이디 혹은 비밀번호를 다시 한번 확인해 주세요."
    @State var isIdEditing: Bool = false
    @State var isPasswordEditing: Bool = false
    @State var selectionSex = 0
    @State var age: String = "0"
    
    @Binding var isLogin: Bool
    
    var selectSex = ["남", "여"]
    
    let userStore: UserStore = UserStore()
    
    var body: some View {
        VStack {
            LogoImageView()
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("아이디")
                TextField("이메일을 입력해주세요.", text: $id)
                    .modifier(TextFieldFrame())
                
                Text("비밀번호")
                SecureField("비밀번호를 입력해주세요", text: $password)
                    .modifier(TextFieldFrame())
                
                Text("비밀번호 확인")
                SecureField("비밀번호를 입력해주세요", text: $passwordConfirm)
                    .modifier(TextFieldFrame())
                
                HStack {
                    Picker("성별을 선택하세요", selection: $selectionSex) {
                        ForEach(0 ..< 2) {
                            Text(selectSex[$0])
                        }
                    }
                    
                    Text("나이")
                    TextField("", text: $age)
                        .modifier(TextFieldFrame())
                        .keyboardType(.decimalPad)
                }
            }
            .padding()
            
            NavigationLink(destination: LoginView(isLogin: $isLogin), label: {
                Text("회원가입")
                    .modifier(ButtonTitle())
            })
            .modifier(ButtonFrame())
            
            Spacer()
                
        }
    }
}

#Preview {
    SignupView(isLogin: .constant(false))
}
