//
//  RcHistoryView.swift
//  RcSaveApp
//
//  Created by 酒匂竜也 on 2024/05/22.
//

import SwiftUI

struct RcHistoryView: View {
    
    // 投稿画像が入る変数
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            // 画像を配置する
            Image(systemName: "globe")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width, alignment: .center)
                .clipShape(Rectangle())
            // 区切り線を入れる
            Divider()
            Group {
                Text("ジャンル:　") + Text("テスト")
                Text("商品名:　") + Text("テスト")
                Text("個数:　") + Text("テスト")
                Text("投稿日時: ") + Text("xx月xx日")
            }
            // 横幅いっぱいに広げる、左寄せにする
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(3)
        }
    }
}



#Preview {
    RcHistoryView()
}
