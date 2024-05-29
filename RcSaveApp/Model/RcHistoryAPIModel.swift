//
//  RcHistoryAPI.swift
//  RcSaveApp
//
//  Created by 酒匂竜也 on 2024/05/23.
//

import Foundation
import Alamofire
import Combine

class RcHistoryAPIModel: ObservableObject {
    
    // 投稿した履歴が入る配列
    @Published var historyDataArray: [HistoryData] = []
    
    /*
     APIファイルにアクセスするためのメソッド
     */
    func Api() {
        let url = "http://localhost:8888/KeepFood/iOS/Controller/ShopingHistoryController.php"
        AF.request(url).responseData{ response in
            switch response.result {
            case.success(let data):
                do {
                    let decoder = JSONDecoder()
                    self.historyDataArray = try decoder.decode([HistoryData].self, from: data)
                } catch {
                    print("JSONデコードエラー: \(error)")
                }
                
            case.failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
