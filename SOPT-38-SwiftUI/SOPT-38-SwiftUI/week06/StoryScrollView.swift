//
//  StoryScrollView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct StoryScrollView: View {
    @State var isActive = [false, false, false, false, false]
    let chatUsers: [ChatUser]
    
    var body : some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(chatUsers.indices, id: \.self) { index in
                        StoryProfileView(
                            isActive: $isActive[index], chatUser: chatUsers[index]
                        )
                    }
                }
            }.padding([.leading, .top, .bottom])
            List(chatUsers.indices, id: \.self) { index in
                StoryChatView(
                    isActive: $isActive[index],
                    chatUser: chatUsers[index]
                )
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    StoryScrollView(chatUsers: users)
}
