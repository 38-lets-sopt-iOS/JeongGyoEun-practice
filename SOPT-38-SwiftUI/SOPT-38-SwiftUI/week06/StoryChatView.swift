//
//  StoryChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct StoryChatView: View {
    @Binding var isActive: Bool
    let chatUser: ChatUser
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding([.leading, .trailing], 5)
                    .foregroundStyle(isActive ? .blue : .gray)
                    .overlay(alignment: .bottomTrailing) {
                        Circle()
                            .fill(isActive ? .green : .gray)
                            .frame(width: 10, height: 10)
                            .offset(x: -3, y: -3)
                    }
                VStack(alignment: .leading) {
                    Text(chatUser.name)
                        .font(.headline)
                    Text(chatUser.message)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text("오전 9:41")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding([.trailing])
            }
        }.onTapGesture() {
            isActive.toggle()
        }
    }
}
