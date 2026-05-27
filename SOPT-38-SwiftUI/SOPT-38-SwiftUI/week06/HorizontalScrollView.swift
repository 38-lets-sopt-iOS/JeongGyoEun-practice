//
//  HorizontalScrollView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/16/26.
//

import SwiftUI

struct HorizontalScrollViewPractice: View {
    var body : some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
