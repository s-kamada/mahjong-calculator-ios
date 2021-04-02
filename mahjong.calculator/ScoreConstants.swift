//
//  ScoreConstants.swift
//  mahjong.calculator
//
//  Created by 鎌田峻輔 on 2021/04/02.
//

import Foundation

public struct ScoreConstants {

    public var position: Position = .nonDealer

    init(as position: Position) {
        self.position = position
    }

    // 定数として扱いたいんだが...
    public var mangan: Int {
        return position.isDealer() ? 12000 : 8000
    }

    public var haneman: Int {
        return position.isDealer() ? 18000 : 12000
    }

    public var baiman: Int {
        return position.isDealer() ? 24000 : 16000
    }

    public var sanbaiman: Int {
        return position.isDealer() ? 36000 : 24000
    }

    public var yakuman: Int {
        position.isDealer() ? 48000 : 32000
    }
}

public enum Position {
    case dealer
    case nonDealer

    func isDealer() -> Bool {
        return self == .dealer
    }
}
