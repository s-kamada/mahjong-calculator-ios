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
    // TODO: 点数計算の条件に関わるものをtypealiasとかでまとめる
    // 親子・飜・符・ツモロン
    static func score(fan: Int, fu: Int, position: Position) -> Int {

        switch fan {
        case 1,2,3,4:
            return calculatescore(fan: fan, fu: fu)

        case 5:
            return ScoreConstants(as: position).mangan

        case 6,7:
            return ScoreConstants(as: position).haneman

        case 8,9,10:
            return ScoreConstants(as: position).baiman

        case 11,12:
            return ScoreConstants(as: position).sanbaiman

        default:
            return ScoreConstants(as: position).yakuman
        }
    }

    private static func calculatescore(fan: Int, fu: Int) -> Int {
        let score: Double = Double(fu * 4 * Int(pow(Double(2), Double(fan + 2)))) / 100
        let ceiledScore = ceil(score) * 100

        return Int(ceiledScore)
    }
}
