//
//  StoryProfileView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//


import SwiftUI

struct StoryProfileView: View {
    let chatUser: ChatUser
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}
