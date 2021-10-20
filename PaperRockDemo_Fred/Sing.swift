//
//  Sing.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//


//設定三種拳法 (Enum + Computed Property)
enum Sing: CaseIterable {
    case rock
    case paper
    case scissors
    
    var botSing: String {
        
        switch self {
            
        case .rock:
            return "✊🏼"
        case .paper:
            return "✋🏼"
        case .scissors:
            return "✌🏼"
        }
    }
    //判斷輸贏 並回傳 遊戲狀態
    func gameState(userSing UserSing: Sing) -> GameStatus {
        
        if self == UserSing { return .draw }
        
        switch self {
            
        case .rock:
            if UserSing == .scissors { return .win }
        case .paper:
            if UserSing == .rock { return .win }
        case .scissors:
            if UserSing == .paper { return .win }
        }
        return .lost
    }
}

//產生隨機拳法
func randomSing() -> Sing {
    
    var robotSing = Sing.allCases
    
    robotSing = robotSing.shuffled()
    
    return robotSing[0]
}

