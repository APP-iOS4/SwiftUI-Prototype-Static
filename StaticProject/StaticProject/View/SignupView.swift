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
    @State var isPasswordConfirmEditing: Bool = false
    @State var isLogin: Bool = false
    
    let userStore: UserStore = UserStore()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("아이디")
                TextField("이메일을 입력해주세요.", text: $id,  onEditingChanged:  { edit in
                    
                    isIdEditing = edit
                })
                    .textFieldStyle(MyTextFieldStyle(focused: $isIdEditing))
                    .font(.title2)

                
                Text("비밀번호")
                SecureField("비밀번호를 입력해주세요", text: $password, onCommit: { isPasswordEditing = false })
                    .onTapGesture {
                        isPasswordEditing = true
                    }
                    .textFieldStyle(MyTextFieldStyle(focused: $isPasswordEditing))
                    .font(.title2)
                
                Text("비밀번호 확인")
                SecureField("비밀번호를 입력해주세요", text: $passwordConfirm, onCommit: { isPasswordConfirmEditing = false })
                    .onTapGesture {
                        isPasswordConfirmEditing = true
                    }
                    .textFieldStyle(MyTextFieldStyle(focused: $isPasswordConfirmEditing))
                    .font(.title2)
            }
            .padding()
            
            
//            Button {
//                userStore.loginUser(id: id, password: password)
//            } label: {
//                Text("로그인")
//                    .modifier(ButtonTitle())
//            }
//            .modifier(ButtonFrame())
            
            NavigationLink(destination: LoginView(), label: {
                Text("회원가입")
                    .modifier(ButtonTitle())
            })
            .modifier(ButtonFrame())
            
            Spacer()
                
        }
    }
}

#Preview {
    SignupView()
}
