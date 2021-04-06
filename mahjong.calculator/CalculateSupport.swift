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

    struct WinningInfo {
        var fan: Int
        var fu: Int
        var position: Position
        var isTsumo: Bool
    }

    // 基本点と合計の収入を分けないとツモの場合表記しにくい
    struct Score {
        var kihonten: Int
        var total: Int
        var shiharai: Shiharai

        struct Shiharai {
            var dealer: Int
            var players: Int
        }
    }
    // TODO: 点数計算の条件に関わるものをtypealiasとかでまとめる
    // 親子・飜・符・ツモロン
    static func score(fan: Int, fu: Int, position: Position) -> Int {

        switch fan {
        case 1,2,3:
            return calculatescore(fan: fan, fu: fu)

        // TODO: 切り上げ満貫かどうかに対応
        case 4:
            return ScoreConstants(as: position).mangan

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
