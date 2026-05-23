//
//  LazyGridView.swift
//  SOPT-38-SwiftUI
//
//  Created by 정교은 on 5/23/26.
//

import SwiftUI

struct LazyGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View{
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<20){ i in
                    VStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.cyan)
                            .frame(height: 90)
                            .padding([.top, .leading, .trailing])
                        Text("아이템 \(i)").foregroundColor(.black)
                            .padding([.bottom])
                    }
                }.frame(height: 150).background(.blue).cornerRadius(10)
            }
        }
    }
}

#Preview {
    LazyGridView()
}
