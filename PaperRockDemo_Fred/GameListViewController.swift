//
//  GameListViewController.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//

import UIKit

class GameListViewController: UIViewController {
    
    var gameCount: GameCount!
    
    func checkGameState() {
        if gameCount.gameWinCount == 2 {
            showGameStateLabel.text = "恭喜你贏了"
        } else {
            showGameStateLabel.text = "你輸了，要再來一次嗎？"
        }
    }
    
    
    @IBOutlet weak var showGameStateLabel: UILabel!
    @IBOutlet weak var showGameCountLabel: UILabel!
    @IBOutlet weak var replayButtonOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        replayButtonOutlet.setTitle(SystemMsg.replay.rawValue, for: .normal)
        checkGameState()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func replayButtonAction(_ sender: Any) {
        
    }
    
}
