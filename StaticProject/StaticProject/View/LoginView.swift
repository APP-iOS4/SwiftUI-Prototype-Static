//
//  LoginView.swift
//  StaticProject
//
//  Created by 하윤호 on 2/20/24.
//

import SwiftUI

struct LoginView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var loginError: String = "아이디 혹은 비밀번호를 다시 한번 확인해 주세요."
    @State var isIdEditing: Bool = false
    @State var isPasswordEditing: Bool = false
    @State var isLogin: Bool = false
    
    let userStore: UserStore = UserStore()
    
    var body: some View {
        VStack {
            LogoImageView()
            
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
            }
            .padding()
            
            Text("\(loginError)")
                .font(.callout)
                .foregroundStyle(Color("MainColor"))
            
//            Button {
//                userStore.loginUser(id: id, password: password)
//            } label: {
//                Text("로그인")
//                    .modifier(ButtonTitle())
//            }
//            .modifier(ButtonFrame())
            
            NavigationLink(destination: MainView(), label: {
                Text("로그인")
                    .modifier(ButtonTitle())
            })
            .modifier(ButtonFrame())
            
            Spacer()
                
        }
    }
}

#Preview {
    LoginView()
}

struct MyTextFieldStyle: TextFieldStyle {
    @Binding var focused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(focused ? Color("MainColor") : Color(UIColor.systemGray5), lineWidth: 1)
        )
        .padding(5)
    }
}
