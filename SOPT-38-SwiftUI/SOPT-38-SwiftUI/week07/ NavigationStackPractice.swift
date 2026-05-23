//
//   NavigationStackPractice.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/23/26.
//

import SwiftUI

struct Ganadi: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emoji: String
    let detail: String
    
    static let friends: [Ganadi] = [
        Ganadi(
            name: "가나디",
            emoji: "🐶",
            detail: "개"
        ),
        Ganadi(
            name: "고냐니",
            emoji: "🐈",
            detail: "대장, 본인 이외엔 다 부하, 강하다"
        ),
        Ganadi(
            name: "두도지",
            emoji: "🧸",
            detail: "두더지 외계인, 가나디와 친구들을 관찰중, 말할 수 있음"
        ),
        Ganadi(
            name: "공룡이",
            emoji: "🦕",
            detail: "바쁜 현대인, 사람친구가 없다, 최근 템플스테이에 관심을 가지고 있다"
        ),
        Ganadi(
            name: "햄스터",
            emoji: "🐹",
            detail: "용감하다"
        ),
        Ganadi(
            name: "와와",
            emoji: "🐕",
            detail: "성격:미침, 치와와, 수줍음이 많다"
        )
    ]
}

struct NavigationStackPractice: View {
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            List(Ganadi.friends) { friend in
                NavigationLink(friend.name, value: friend)
            }
            
            .navigationDestination(for: Ganadi.self){ friend in
                DetailView(friend: friend)
            }
            .navigationTitle("듀 . .")
            Button("이동하기 state 버전") {
                isPresented = true
            }
            .navigationDestination(isPresented: $isPresented) {
                GanadiImageView()
            }
        }
    }
}

struct NavigationPathPractice: View {
    let ganadi = Ganadi.friends
    @State private var path = NavigationPath() // path 선언
    
    var body: some View {
            // path를 NavigationStack에 연결하는 법
        NavigationStack(path: $path) {
            List(ganadi, id: \.self) { friend in
                Button(friend.name) {
                    path.append(friend) // 버튼을 누르면 Ganadi 구조체가 path에 들어감
                }
            }
            .navigationTitle("\(path.count)번째 view") // 타이틀
            
            // path에 담긴 타입을 보고 그에 맞는 View로 이동
            .navigationDestination(for: Ganadi.self) { ganadi in
                EmojiView(ganadi: ganadi, path: $path) // path가 Ganadi라면 EmojiView로 이동
            }
            .navigationDestination(for: String.self) { info in
                InfoView(info: info, path: $path) // path가 String이라면 InfoView로 이동
            }
        }
    }
}

struct GanadiImageView: View {
    
  var body: some View {
      Image(.ganadi)
          .resizable()
          .scaledToFit()
  }
}


struct DetailView: View {
    let friend: Ganadi
    
    var body: some View {
        Text(friend.emoji)
        Text(friend.detail)
            .navigationTitle(friend.name)
    }
}

struct EmojiView: View {
    let ganadi: Ganadi
    @Binding var path: NavigationPath // path를 Binding으로 받음
    // path는 루트 뷰에서 선언되었기 때문에, 하위 뷰에서 수정하려면 @Binding으로 받아야 함!
    
    var body: some View {
        VStack {
            Text(ganadi.name)
            Text(ganadi.emoji)
            
            Button("상세 정보 보기") {
                path.append(ganadi.detail)
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}

struct InfoView: View {
    let info: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(info)
            
            Button("루트로 돌아가기") {
                path.removeLast(path.count) // path가 빈 배열이 되면서 루트로 이동
            }
        }
        .navigationTitle("\(path.count)번째 view")
    }
}

#Preview {
    NavigationPathPractice()
}
