//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    let chatList: ChatListModel
    
    var body: some View {
        HStack {
            Image(chatList.profileImage)
                .resizable()
                .frame(width: 50, height: 50)
                .padding([.leading])
            VStack(alignment: .leading) {
                HStack {
                    Text(chatList.name)
                        .font(.headline)
                    Text(chatList.location)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Text(chatList.lastMessage)
            }
            Spacer()
        }
    }
}
