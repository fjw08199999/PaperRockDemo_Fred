//
//  PlayViewController.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//

import UIKit


class PlayViewController: UIViewController {
    
    //遊戲輸贏計數器
    var gameWinCount: Int = 0
    var gameLostCount: Int = 0
    
    @IBOutlet weak var botDisplaylabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var showGameCountLabel: UILabel!
    
    @IBOutlet weak var userSingRockButton: UIButton!
    @IBOutlet weak var userSingPaperButton: UIButton!
    @IBOutlet weak var userSingScissorsButton: UIButton!
    @IBOutlet weak var replayButtonOutlet: UIButton!
    
    //接收從按鈕來的玩家出拳 並電腦會隨機產生一個拳法 並判斷輸贏
    //內容包含:
    //1.電腦隨機產生拳法
    //2.顯示遊戲狀態
    //3.產生電腦頭像
    //4.判斷輸贏 並回傳 遊戲狀態 .win .lost .draw
    //5.計算贏的次數 並將次數更新於showGameCountLabel
    func playGame(userSing: Sing) {
        
        let botSing = randomSing()
        let gameStatus = userSing.gameState(userSing: botSing)
        
        gameStatusLabel.text = gameStatus.state
        botDisplaylabel.text = botSing.botSing
        
        switch gameStatus {
        case .start:
            return
        case .win:
            gameWinCount += 1
            return showGameCountLabel.text = "勝 \(gameWinCount) 場，敗 \(gameLostCount)場"
        case .lost:
            gameLostCount += 1
            return showGameCountLabel.text = "勝 \(gameWinCount) 場，敗 \(gameLostCount)場"
        case .draw:
            return
        }
        
    }
    
    //更新Mail畫面
    func uppdateUI() {
        botDisplaylabel.text = SystemMsg.bot.rawValue
        gameStatusLabel.text = GameStatus.start.state.description
        
        userSingRockButton.setTitle(SystemMsg.rock.rawValue, for: .normal)
        userSingPaperButton.setTitle(SystemMsg.paper.rawValue, for: .normal)
        userSingScissorsButton.setTitle(SystemMsg.scissors.rawValue, for: .normal)
        replayButtonOutlet.setTitle(SystemMsg.replay.rawValue, for: .normal)
        showGameCountLabel.text = "勝 \(gameWinCount) 場，敗 \(gameLostCount)場"
        
        replayButtonOutlet.isHidden = true
        
    }
    
    //判斷如果遊戲結束則穎隱藏所有按鈕 並觸發將頁面轉至下一頁
    func showGameList() {
        if gameWinCount == 2 || gameLostCount == 2 {
            
            replayButtonOutlet.isHidden = false
            userSingRockButton.isHidden = true
            userSingPaperButton.isHidden = true
            userSingScissorsButton.isHidden = true
            
            performSegue(withIdentifier: "showGameList", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //遊戲開始先更新畫面
        uppdateUI()
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func rockButtonAction(_ sender: Any) {
        playGame(userSing: .rock)
        showGameList()
    }
    
    @IBAction func paperButtonAction(_ sender: Any) {
        playGame(userSing: .paper)
        showGameList()
    }
    
    @IBAction func scissorsButtonAction(_ sender: Any) {
        playGame(userSing: .scissors)
        showGameList()
    }
    
    //將GameCount資料傳至下一頁
    @IBSegueAction func dataTansferFunction(_ coder: NSCoder) -> GameListViewController? {
        let controller = GameListViewController(coder: coder)
        controller?.gameCount = GameCount(gameWinCount: gameWinCount, gameLostCount: gameLostCount)
        
        return controller
        
    }
    
    //重玩按鈕
    @IBAction func replayButtonAction(_ sender: Any) {
        
        //清除勝負計數器
        gameWinCount = 0
        gameLostCount = 0
        
        //更新畫面
        uppdateUI()
        
        //顯示猜拳 剪刀 石頭 布 的按鈕
        userSingRockButton.isHidden = false
        userSingPaperButton.isHidden = false
        userSingScissorsButton.isHidden = false
        
    }
    
}
