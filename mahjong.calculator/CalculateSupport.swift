//
//  CalculateSupport.swift
//  mahjong.calculator
//
//  Created by 鎌田峻輔 on 2021/04/02.
//

import Foundation

final class CalculateSupprt {
    /**
     麻雀の点数計算
     ４０(符) ✕ ４ ✕ ２の５(翻)乗 ＝　点数
     ４０ ✕ ４ ✕ ２ ✕ ２ ✕ ２ ✕ ２ ✕ ２ ＝　５,１２０
     */
    class func score(fan: Int, fu: Int) -> Int {

        let score: Double = Double(fu * 4 * Int(pow(Double(2), Double(fan + 2)))) / 100
        let ceiledScore = ceil(score) * 100

        return Int(ceiledScore)
    }
}
