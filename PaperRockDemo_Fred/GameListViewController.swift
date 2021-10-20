//
//  GameListViewController.swift
//  PaperRockDemo_Fred
//
//  Created by fred fu on 2021/10/10.
//

import UIKit

protocol ResultViewControllerProtocol {
    func dialogDismissed()
}


class GameListViewController: UIViewController {
    
    //接前一頁傳來的資料 型別為GameCount
    var gameCount: GameCount!
    var delegate: ResultViewControllerProtocol?
    
    
    //判斷傳過來的值gameWinCount & gameLostCount 是否等於2 如果等於2 代表三戰兩勝的結果出來了 則顯示相對應得文字
//    func checkGameState() {
//
//        if gameCount.gameWinCount == 2 {
//            showGameStateLabel.text = GameStatus.win.state.description
//        } else if gameCount.gameLostCount == 2 {
//            showGameStateLabel.text = GameStatus.lost.state.description
//        }
//    }
    
    func checkGameState() {
            
            guard gameCount.gameWinCount == 2 else {

              guard gameCount.gameLostCount == 2 else { return }
                showGameStateLabel.text = GameStatus.lost.state.description
                return
            }
            showGameStateLabel.text = GameStatus.win.state.description
        }
    
    @IBOutlet weak var showGameStateLabel: UILabel!
    @IBOutlet weak var replayButtonOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        checkGameState()
        
        //設定按鈕文字
        replayButtonOutlet.setTitle(SystemMsg.replay.rawValue, for: .normal)
        //隱藏按鈕
        replayButtonOutlet.isHidden = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //GameListViewController的按鈕 功能未實做
    @IBAction func replayButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        delegate?.dialogDismissed()
    }
    
}
