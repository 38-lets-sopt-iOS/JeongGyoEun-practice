//
//  StoryChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct StoryChatView: View {
    let chatUser: ChatUser
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle.fill")                .resizable()
                    .frame(width: 40, height: 40)
                    .padding([.leading])
                VStack(alignment: .leading) {
                    HStack {
                        Text(chatUser.name)
                            .font(.headline)
                        Text(chatUser.message)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    Text(chatUser.message)
                }
                Spacer()
                Text("오전 9:41")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding([.trailing])
            }
        }
    }
}
