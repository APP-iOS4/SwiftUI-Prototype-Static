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
    @Binding var isLogin: Bool
    
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
            }
            .padding()
            
            Text("\(loginError)")
                .font(.callout)
                .foregroundStyle(Color("MainColor"))
            
            NavigationLink(destination: MainView(), label: {
                Button {
                    isLogin.toggle()
                } label: {
                    Text("로그인")
                        .modifier(ButtonTitle())
                }
            })
            .modifier(ButtonFrame())
            
            Spacer()
                
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

#Preview {
    LoginView(isLogin: .constant(false))
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

struct TextFieldFrame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .padding(3)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color(UIColor.systemGray5), lineWidth: 1)
            )
            .padding(4)
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
