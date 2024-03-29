# Static(정전기)⚡️
빠르게 모이는 '번개'보다 가볍고 즉흥적이라는 뜻을 담은 '정전기'는
<br>
모임에는 들어가고 싶지는 않고, 하루만 사람들과 놀고 싶은 사람들을 위한 앱입니다.
<br>
부담없이 참여하고 부담없이 헤어질 수 있는 비친목 커뮤니티를 지향합니다.



## 개발 기간  
**개발기간: 총 3일** 
<br>
<br>
기획(1일)
<br>
프로토 타입(1일)
<br>
시연 및 수정(1일)
<br><br>
  
## 구현 목표
- 진입장벽을 최대한 낮추어 누구든지 쉽고 빠르게 모임에 참여할 수 있도록 합니다.

## 특징
- 비친목 커뮤니티
  - 매일 매일 사라지는 기존 모임 방
  - 최대 3일까지 설정된 개설 날짜 제한

<br>

## 개발환경
- Xcode 15.0
- SwiftUI

<br>

## 실행환경
- Xcode 15.0
- iOS 17.0
- iPhone 15pro (시뮬레이터)

<br>

## 실행 방법
1. Git 프로젝트를 Clone한다
2. 프로젝트 폴더의 StaticProject.xcodeproj 프로젝트 파일을 Xcode로 열기
3. Xcode의 Run으로 실행

<br>

## 사용자 시나리오

### 초기 설정
1. 회원가입 버튼 눌러 회원가입
2. 아이디, 비밀번호를 입력 후 로그인

| 시작화면 | 로그인 뷰 | 계정 생성 뷰 |
|:---:|:---:|:---:|
|![시작화면 뷰](./img/StartView.png)|![로그인 뷰](./img/LoginView.png)|![로그인 뷰](./img/SignUpView.png)|

<br>
<br>

### 만들어진 모임에 참여하는 경우
1. 날짜와 온/오프라인 설정을 확인
2. 원하는 방 리스트 클릭
3. 방의 자세한 설명을 확인 후 '참가하기' 버튼 클릭을 눌러 참가하기
4. 채팅으로 자세한 정보를 확인

| 메인 뷰 | 방 확인 뷰  | 대화방 뷰 |
|:---:|:---:|:---:|
|![시작화면 뷰](./img/MainView.png)|![로그인 뷰](./img/DetailRoomView.png)|![로그인 뷰](./img/TalkView.png)|

### 특정한 모임을 탐색하는 경우
1. '탐색' 탭을 눌러 탐색 페이지로 이동
2. 날짜, 온/오프라인, 카테고리 설정을 확인
3. 원하는 방 리스트 클릭
4. 방의 자세한 설명을 확인 후 '참가하기' 버튼 클릭을 눌러 참가하기
5. 채팅으로 자세한 정보를 확인

| 탐색 뷰 | 방 확인 뷰  | 대화방 뷰 |
|:---:|:---:|:---:|
|![시작화면 뷰](./img/SearchView.png)|![로그인 뷰](./img/DetailRoomView.png)|![로그인 뷰](./img/TalkView.png)|

### 모임을 생성하는 경우
1. 오른쪽 아래의 +버튼을 눌러 모임 생성 창에 진입
2. 모임의 이름, 인원, 날짜 및 시간, 카테고리, 모임 소개, 태그를 설정
3. '생성하기' 버튼을 눌러 모임을 생성

| 메인 뷰 | 방 생성 뷰  | 대화방 뷰 |
|:---:|:---:|:---:|
|![시작화면 뷰](./img/MainView.png)|![로그인 뷰](./img/CreateRoomView.png)|![로그인 뷰](./img/TalkView.png)|

### 참여한 방을 확인하는 경우
1. '참여한 방' 탭을 눌러 참여한 방 페이지로 이동
2. 원하는 방 리스트 클릭
3. 방의 자세한 설명을 확인한 후 좌하단의 말풍선 버튼을 눌러 '채팅방'으로 입장

| 참여한 방 뷰 | 참가한 방 확인 뷰  | 대화방 뷰 |
|:---:|:---:|:---:|
|![시작화면 뷰](./img/ParticipateView.png)|![로그인 뷰](./img/ExitRoomView.png)|![로그인 뷰](./img/TalkView.png)|

<br>

-----

<br>

## 미구현된 기능
1. 사용자 위치 수정 기능 미구현
2. 각 방의 상세 페이지로 이동한 후 나오는 '참가하기' 버튼 실제 데이터 반영 안됨
3. 방 '생성하기' 버튼의 실제 데이터 반영 안됨
4. 방 '나가기' 버튼의 실제 데이터 반영 안됨

<br>

-----

<br>

|💪<br>강건|🌚<br>이선준|🌝<br>최준영|🦦<br>하윤호|🎧<br>한국선|
|:---:|:---:|:---:|:---:|:---:|
|잼민이(제미나이) 너 내 동료가 돼라!|가랏! 찌리릿! 몸통박치기! 응?|정전기 짜릿해 늘 새로워 최고야|피카츄는 귀엽습니다|찌리릿! 찟!! 찟찟!!|
|<img src="https://avatars.githubusercontent.com/u/141600830?v=4" width="80%">|<img src="https://avatars.githubusercontent.com/u/115583150?v=4" width="80%">|<img src="https://avatars.githubusercontent.com/u/148533329?v=4" width="80%">|<img src="https://avatars.githubusercontent.com/u/101854288?v=4" width="80%">|<img src="https://avatars.githubusercontent.com/u/104252650?v=4" width="80%">|
|[@kangsworkspace](https://github.com/kangsworkspace)|[@SunJuneL](https://github.com/SunJuneL)|[@DevJunnn](https://github.com/DevJunnn)|[@Hayunho](https://github.com/Hayunho)|[@banhada](https://github.com/banhada)|

<br>

----

# License
Copyright 멋쟁이사자처럼 Lab1. All rights reserved.

Licensed under the [MIT](LICENSE) license.

<br><br>
