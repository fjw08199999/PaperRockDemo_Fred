//
//  PlayViewController.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//

import UIKit

class PlayViewController: UIViewController {
    
    var gameWinCount: Int = 0
    var gameLostCount: Int = 0
    var gameState: GameStatus = .start
    
    @IBOutlet weak var botDisplaylabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var showGameCountLabel: UILabel!
    
    @IBOutlet weak var userSingRockButton: UIButton!
    @IBOutlet weak var userSingPaperButton: UIButton!
    @IBOutlet weak var userSingScissorsButton: UIButton!
    @IBOutlet weak var replayButtonOutlet: UIButton!
    
    
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
    
    @IBSegueAction func dataTansferFunction(_ coder: NSCoder) -> GameListViewController? {
        let controller = GameListViewController(coder: coder)
        controller?.gameCount = GameCount(gameWinCount: gameWinCount, gameLostCount: gameWinCount, gameState: GameStatus.start.state.description)
        
        return controller
        
    }
    
    @IBAction func replayButtonAction(_ sender: Any) {
        gameWinCount = 0
        gameLostCount = 0
        uppdateUI()
        
        userSingRockButton.isHidden = false
        userSingPaperButton.isHidden = false
        userSingScissorsButton.isHidden = false
        
    }
    
}
