//
//  StoryProfileView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct StoryProfileView: View {
    @Binding var isActive: Bool
    let chatUser: ChatUser
    
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundStyle(isActive ? .blue : .gray)
                .frame(width: 60, height: 60)
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .fill(isActive ?.green :.gray)
                        .frame(width: 15, height: 15)
            }
        }.onTapGesture() {
            isActive.toggle()
        }
    }
}
