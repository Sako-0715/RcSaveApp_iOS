//
//  RcHistoryController.swift
//  RcSaveApp
//
//  Created by 酒匂竜也 on 2024/05/23.
//

import Foundation
import Combine

class RcHistoryController: ObservableObject {  // ここでObservableObjectに準拠
    
    // API通信時に取得する配列
    @Published var historyData: [HistoryData] = []
    // APIモデルにを定義
    private var historyApi = RcHistoryAPIModel()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
            // APIモデルの変更を監視して、コントローラーのプロパティを更新
        historyApi.$historyDataArray
                .sink { [weak self] data in
                    self?.historyData = data
                }
                .store(in: &cancellables)
        }
    
    /*
     商品名の文字数が多い場合はフォントサイズを調整するためのメソッド
     */
    private func FontSize(productName: String) -> CGFloat {
        let maxLength = 20 // フォントサイズを最大にする文字数
        let minLength = 10 // フォントサイズを最小にする文字数
        let scaleFactor: CGFloat = 0.5 // 文字数1文字に対するフォントサイズの減少率
        let productNameLength = productName.count
        
        // フォントサイズを計算
        var fontSize = CGFloat(maxLength - productNameLength) * scaleFactor + 16 // デフォルトのフォントサイズ16
        if fontSize < CGFloat(minLength) {
            fontSize = CGFloat(minLength)
        }
        return fontSize
    }
    /*
    日付のフォーマットを変えるためのメソッド
     */
    private func FormatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd" // 新しい日付フォーマット
        if let date = dateFormatter.date(from: dateString) {
            return dateFormatter.string(from: date)
        } else {
            return dateString // 日付の変換に失敗した場合は元の文字列を返す
        }
    }
}
