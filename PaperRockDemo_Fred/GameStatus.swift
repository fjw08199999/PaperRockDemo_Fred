//
//  GameStatus.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//

struct GameCount {
    var gameWinCount: Int
    var gameLostCount: Int
    var gameState: Any
}

enum GameStatus {
    case start
    case win
    case lost
    case draw
    
    var state: String {
        switch self {
        case .start:
            return "遊戲開始，三戰兩勝"
        case .win:
            return "哇！你好厲害，你贏了"
        case .lost:
            return "嘿嘿！你輸了，再來一次"
        case .draw:
            return "棋逢敵手，再來一次"
        }
    }
}

enum SystemMsg: String {
    case bot = "🌚"
    case rock = "✊🏼"
    case paper = "✋🏼"
    case scissors = "✌🏼"
    case replay = "重玩"
}
